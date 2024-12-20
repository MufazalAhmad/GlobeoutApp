import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/domain/models/user_request/user_request.dart';
import 'package:globout/features/friends/domain/usecases/get_recieved_friend_requests.dart';

import '../../../../util/di/di.dart';

final getReceivedFriendsRequestsProvider =
    StreamProvider<List<UserRequest>>((ref) {
  final user = ref.watch(userProvider);

  final getFriendRequests = sl<GetReceivedFriendRequestsUsecase>();
  final input = GetReceivedFriendRequestsUsecaseInput(userId: user!.id);

  final output = getFriendRequests(input);

  return output.friendsRequests;
});
