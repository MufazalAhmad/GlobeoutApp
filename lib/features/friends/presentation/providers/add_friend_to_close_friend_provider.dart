import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/domain/usecases/add_friend_to_close_friend.dart';
import 'package:globout/util/di/di.dart';

final addFriendToCloseFriendsProvider =
    FutureProvider.family.autoDispose<void, String>((ref, friendId) async {
  final user = ref.watch(userProvider);

  final addFriendToCloseFriend = sl<AddFriendToCloseFriendUsecase>();

  final input =
      AddFriendToCloseFriendUsecaseInput(userId: user!.id, friendId: friendId);

  await addFriendToCloseFriend(input);
});
