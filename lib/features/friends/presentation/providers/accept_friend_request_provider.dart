import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/domain/models/user_request/user_request.dart';
import 'package:globout/features/friends/domain/usecases/accept_friend_request.dart';

import '../../../../util/di/di.dart';

final acceptFriendRequestProvider = FutureProvider.autoDispose
    .family<void, UserRequest>((ref, userRequest) async {
  final acceptFriendRequest = sl<AcceptFriendRequestUsecase>();

  final requestId = userRequest.id;
  final sentById = userRequest.user.id;

  final currentUser = ref.watch(userProvider);

  final input = AcceptFriendRequestUsecaseInput(
    requestId: requestId,
    sentById: sentById,
    sentToId: currentUser!.id,
  );
  await acceptFriendRequest(input);
});
