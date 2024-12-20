import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/domain/usecases/add_friend.dart';
import 'package:globout/features/friends/domain/usecases/set_initial_invites_sent_usecase.dart';
import 'package:globout/util/di/di.dart';

final addFriendProvider =
    FutureProvider.autoDispose.family<void, String>((ref, sendToId) async {
  final addFriend = sl<AddFriendUsecase>();
  final setInitialInvitesSentTrueUsecase =
      sl<SetInitialInvitesSentUsecaseUsecase>();
  final currentUser = ref.watch(userProvider);

  try {
    final input =
        AddFriendUsecaseInput(friendId: sendToId, userId: currentUser!.id);
    await addFriend(input);
    final setInitialInvitesSentTrueUsecaseInput =
        SetInitialInvitesSentUsecaseUsecaseInput(
      userId: currentUser.id,
    );

    setInitialInvitesSentTrueUsecase(setInitialInvitesSentTrueUsecaseInput);
    ref.read(userProvider.notifier).updateInitialInvitesSent();
  } on String {
    rethrow;
  } catch (e) {
    throw "Something went wrong";
  }
});
