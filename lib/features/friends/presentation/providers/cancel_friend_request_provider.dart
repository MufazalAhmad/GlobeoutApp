import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/domain/models/user_request/user_request.dart';
import 'package:globout/features/friends/domain/usecases/accept_friend_request.dart';
import 'package:globout/features/friends/domain/usecases/cancel_friend_request.dart';

import '../../../../util/di/di.dart';

final cancelFriendRequestProvider = FutureProvider.autoDispose
    .family<void, UserRequest>((ref, userRequest) async {
  final cancelFriendRequest = sl<CancelFriendRequestUsecase>();

  final requestId = userRequest.id;

  final input = CancelFriendRequestUsecaseInput(
    requestId: requestId,
  );
  await cancelFriendRequest(input);
});
