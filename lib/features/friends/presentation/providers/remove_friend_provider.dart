import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/domain/usecases/add_friend_to_close_friend.dart';
import 'package:globout/features/friends/domain/usecases/remove_friend_from_close_friends.dart';
import 'package:globout/util/di/di.dart';

final removeFriendFromCloseFriendsProvider =
    FutureProvider.family.autoDispose<void, String>((ref, friendId) async {
  final user = ref.watch(userProvider);

  final removeFriendToCloseFriend = sl<RemoveFriendFromCloseFriendsUsecase>();

  final input = RemoveFriendFromCloseFriendsUsecaseInput(
      userId: user!.id, friendId: friendId);

  await removeFriendToCloseFriend(input);
});
