import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:globout/features/auth/data/entities/user/firebase_user/firebase_user_entity.dart';
import 'package:globout/features/auth/domain/models/user/user.dart';
import 'package:globout/features/friends/data/entities/founder/founder_entity.dart';
import 'package:globout/features/friends/data/entities/friend/friend_entity.dart';
import 'package:globout/features/friends/data/entities/user_request/user_request_entity.dart';
import 'package:globout/features/friends/data/source/firebase/friends_firebase_datasource.dart';
import 'package:globout/features/friends/domain/models/founder/founder.dart';
import 'package:globout/features/friends/domain/usecases/accept_friend_request.dart';
import 'package:globout/features/friends/domain/usecases/add_friend.dart';
import 'package:globout/features/friends/domain/usecases/add_friend_to_close_friend.dart';
import 'package:globout/features/friends/domain/usecases/cancel_friend_request.dart';
import 'package:globout/features/friends/domain/usecases/follow_user.dart';
import 'package:globout/features/friends/domain/usecases/get_all_friends.dart';
import 'package:globout/features/friends/domain/usecases/get_close_friends.dart';
import 'package:globout/features/friends/domain/usecases/get_founders_usecase.dart';
import 'package:globout/features/friends/domain/usecases/get_recieved_friend_requests.dart';
import 'package:globout/features/friends/domain/usecases/load_users_from_contacts.dart';
import 'package:globout/features/friends/domain/usecases/remove_friend_from_close_friends.dart';
import 'package:globout/features/friends/domain/usecases/set_initial_invites_sent_usecase.dart';
import 'package:globout/features/friends/domain/usecases/un_friend.dart';
import 'package:globout/features/friends/domain/usecases/unfollow_user.dart';
import 'package:globout/util/exceptions/exceptions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FriendsFirebaseDataSource)
class FriendsFirebaseDataSourceImp implements FriendsFirebaseDataSource {
  final _usersRef = FirebaseFirestore.instance.collection("users");
  final _friendsRef = FirebaseFirestore.instance.collection("friends");

  @override
  Future<LoadUsersFromContactsUsecaseOutput> loadUsersFromContacts(
      LoadUsersFromContactsUsecaseInput input) async {
    List<FirebaseUserEntity> entities = <FirebaseUserEntity>[];

    final setOf30Numbers = <List<String>>[];
    var start = 0;
    var end = 30;

    while (end < input.numbers.length) {
      setOf30Numbers.add(input.numbers.sublist(start, end).toList());
      start = end;
      end += 30;
    }

    for (final set in setOf30Numbers) {
      final docs = await _usersRef.where("phNumber", whereIn: set).get();

      final usersJson = docs.docs.map((e) => e.data()).toList();
      final userEntities =
          usersJson.map((e) => FirebaseUserEntity.fromJson(e)).toList();
      entities.addAll(userEntities);
    }

    final myPendingSentFriendRequests =
        await _getFriendsPendingDocsForUser(input.userId);

    for (final friendRequest in myPendingSentFriendRequests) {
      entities = entities
          .map(
            (user) => user.id == friendRequest.requestSentTo
                ? user.copyWith(added: true)
                : user,
          )
          .toList();
    }

    return LoadUsersFromContactsUsecaseOutput(
      users: entities.map((entity) => User.fromEntity(entity)).toList(),
    );
  }

  Future<List<FriendEntity>> _getFriendsPendingDocsForUser(
      String userId) async {
    final docs = await _friendsRef
        .where("members", arrayContains: userId)
        .where('requestApproved', isEqualTo: false)
        .get();
    return docs.docs.map((e) => FriendEntity.fromJson(e.data())).toList();
  }

  @override
  Future<AddFriendUsecaseOutput> addFriend(AddFriendUsecaseInput input) async {
    try {
      final ids = [input.friendId, input.userId];
      final docId = ids.join("_");

      final doc = await _friendsRef.doc(docId).get();

      if (doc.exists) {
        final friend = FriendEntity.fromJson(doc.data()!);
        if (friend.requestSentBy == input.userId &&
            !doc.data()!['requestApproved']) {
          throw "Request already sent";
        }
      } else {
        await _friendsRef.doc(docId).set({
          "id": docId,
          "members": ids,
          "requestApproved": false,
          "requestSentBy": input.userId,
          "requestSentTo": input.friendId,
        });
      }

      return AddFriendUsecaseOutput();
    } on String {
      rethrow;
    } catch (e) {
      throw "Something went wrong!";
    }
  }

  @override
  Future<GetFoundersUsecaseUsecaseOutput> getFounders(
      GetFoundersUsecaseUsecaseInput input) async {
    final docs = await _usersRef.where('isFounder', isEqualTo: true).get();
    final founders =
        docs.docs.map((e) => FounderEntity.fromJson(e.data())).toList();

    return GetFoundersUsecaseUsecaseOutput(
      founders: founders.map((e) => Founder.fromEntity(e)).toList(),
    );
  }

  @override
  Future<FollowUserUsecaseOutput> followUser(
      FollowUserUsecaseInput input) async {
    final followBatch = FirebaseFirestore.instance.batch();

    final myDoc = _usersRef.doc(input.fromUserId);
    final userDoc = _usersRef.doc(input.toUserId);

    followBatch.update(myDoc, {
      "following": FieldValue.arrayUnion([input.toUserId]),
    });

    followBatch.update(userDoc, {
      "followers": FieldValue.arrayUnion([input.fromUserId]),
    });

    await followBatch.commit();

    return FollowUserUsecaseOutput();
  }

  @override
  Future<UnfollowUserUsecaseOutput> unfollowUser(
      UnfollowUserUsecaseInput input) async {
    final unfollowBatch = FirebaseFirestore.instance.batch();

    final myDoc = _usersRef.doc(input.fromUserId);
    final userDoc = _usersRef.doc(input.toUserId);

    unfollowBatch.update(myDoc, {
      "following": FieldValue.arrayRemove([input.toUserId]),
    });

    unfollowBatch.update(userDoc, {
      "followers": FieldValue.arrayRemove([input.fromUserId]),
    });

    await unfollowBatch.commit();

    return UnfollowUserUsecaseOutput();
  }

  @override
  Future<SetInitialInvitesSentUsecaseUsecaseOutput> setInitialInvitesSent(
      SetInitialInvitesSentUsecaseUsecaseInput input) async {
    _usersRef.doc(input.userId).update({
      'initialInvitesSent': true,
    });
    return SetInitialInvitesSentUsecaseUsecaseOutput();
  }

  @override
  GetReceivedFriendRequestsUsecaseOutput getReceivedFriendRequests(
      GetReceivedFriendRequestsUsecaseInput input) {
    try {
      final friendsRequests = _friendsRef
          .where("requestSentTo", isEqualTo: input.userId)
          .where('requestApproved', isEqualTo: false)
          .snapshots();

      final requestsWithUsers = friendsRequests.asyncMap(
        (request) async {
          final data = <Map<String, dynamic>>[];

          for (final requestDoc in request.docs) {
            final requestData = requestDoc.data();
            final userId = requestData['requestSentBy'] as String;
            final userDoc = await FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .get();

            final userData = userDoc.data();

            final friendRequestWithUserData = {
              "id": requestData["id"],
              'user': userData!,
            };
            data.add(friendRequestWithUserData);
          }

          return data;
        },
      );
      final friendRequestEntities = requestsWithUsers.map(
        (event) => event
            .map(
              (e) => UserRequestEntity.fromJson(e),
            )
            .toList(),
      );

      return GetReceivedFriendRequestsUsecaseOutput(
          friendRequests: friendRequestEntities);
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<AcceptFriendRequestUsecaseOutput> acceptFriendRequest(
      AcceptFriendRequestUsecaseInput input) async {
    try {
      /// [run transaction]
      FirebaseFirestore.instance.runTransaction((transaction) async {
        /// [update request approved]
        transaction.delete(_friendsRef.doc(input.requestId));

        /// [add request userId into current user friends list ]
        transaction.update(_usersRef.doc(input.sentToId), {
          "friends": FieldValue.arrayUnion([input.sentById])
        });

        /// [add current userId into requesting user friends list ]
        transaction.update(_usersRef.doc(input.sentById), {
          "friends": FieldValue.arrayUnion([input.sentToId])
        });
      });

      return AcceptFriendRequestUsecaseOutput();
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

  @override
  GetAllFriendsUsecaseOutput getAllFriends(GetAllFriendsUsecaseInput input) {
    try {
      /// [current user]
      final user = _usersRef.doc(input.userId).snapshots();

      /// [Friends data]
      final friends = user.asyncMap((userSnapshot) async {
        final doc = userSnapshot.data();
        final friendsIdsList = List.from(doc?["friends"] ?? []);

        final friendsDocs = await Future.wait(
          friendsIdsList.map((friendId) async {
            final friendDoc = await _usersRef.doc(friendId).get();
            return friendDoc.data() as Map<String, dynamic>;
          }),
        );
        return friendsDocs;
      });

      final userEntities = friends.map(
        (event) =>
            event.map((user) => FirebaseUserEntity.fromJson(user)).toList(),
      );

      return GetAllFriendsUsecaseOutput(friends: userEntities);
    } catch (e) {
      log(e.toString());
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<UnFriendUsecaseOutput> unFriend(UnFriendUsecaseInput input) async {
    try {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.update(_usersRef.doc(input.userId), {
          "friends": FieldValue.arrayRemove([input.friendId]),
          "closeFriends": FieldValue.arrayRemove([input.friendId]),
        });

        transaction.update(_usersRef.doc(input.friendId), {
          "friends": FieldValue.arrayRemove([input.userId]),
          "closeFriends": FieldValue.arrayRemove([input.userId]),
        });
      });

      return UnFriendUsecaseOutput();
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<AddFriendToCloseFriendUsecaseOutput> addFriendToCloseFriend(
      AddFriendToCloseFriendUsecaseInput input) async {
    try {
      /// [run transaction]
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        /// [remove from friends]
        transaction.update(
          _usersRef.doc(input.userId),
          {
            "friends": FieldValue.arrayRemove([input.friendId])
          },
        );

        /// [add in close]
        transaction.update(
          _usersRef.doc(input.userId),
          {
            "closeFriends": FieldValue.arrayUnion([input.friendId])
          },
        );
      });

      return AddFriendToCloseFriendUsecaseOutput();
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

  @override
  GetCloseFriendsUsecaseOutput getCloseFriends(
      GetCloseFriendsUsecaseInput input) {
    try {
      /// [current user]
      final user = _usersRef.doc(input.userId).snapshots();

      /// [Friends data]
      final friends = user.asyncMap((userSnapshot) async {
        final doc = userSnapshot.data();

        final friendsIdsList = List.from(doc?["closeFriends"] ?? []);

        final friendsDocs = await Future.wait(
          friendsIdsList.map((friendId) async {
            final friendDoc = await _usersRef.doc(friendId).get();
            return friendDoc.data() as Map<String, dynamic>;
          }),
        );
        return friendsDocs;
      });

      final userEntities = friends.map(
        (event) =>
            event.map((user) => FirebaseUserEntity.fromJson(user)).toList(),
      );

      return GetCloseFriendsUsecaseOutput(friends: userEntities);
    } catch (e) {
      log(e.toString());
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<RemoveFriendFromCloseFriendsUsecaseOutput>
      removeFriendFromCloseFriends(
          RemoveFriendFromCloseFriendsUsecaseInput input) async {
    try {
      /// [run transaction]
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        /// [add in friends]
        transaction.update(
          _usersRef.doc(input.userId),
          {
            "friends": FieldValue.arrayUnion([input.friendId])
          },
        );

        /// [remove from close friends]
        transaction.update(
          _usersRef.doc(input.userId),
          {
            "closeFriends": FieldValue.arrayRemove([input.friendId])
          },
        );
      });

      return RemoveFriendFromCloseFriendsUsecaseOutput();
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<CancelFriendRequestUsecaseOutput> cancelFriendRequest(
      CancelFriendRequestUsecaseInput input) async {
    try {
      /// [current user]
      await _friendsRef.doc(input.requestId).delete();

      return CancelFriendRequestUsecaseOutput();
    } catch (e) {
      log(e.toString());
      throw SomethingWentWrongException();
    }
  }
}
