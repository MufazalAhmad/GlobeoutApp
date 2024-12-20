import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/domain/usecases/un_friend.dart';

import '../../../../util/di/di.dart';

final unFriendProvider =
    FutureProvider.family.autoDispose<void, String>((ref, friendId) async {
  final user = ref.watch(userProvider);

  final unfriendUsecase = sl<UnFriendUsecase>();

  final input = UnFriendUsecaseInput(userId: user!.id, friendId: friendId);

  await unfriendUsecase(input);
});
