import 'package:globout/features/friends/data/entities/user_request/user_request_entity.dart';
import 'package:globout/features/friends/domain/models/user_request/user_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class GetReceivedFriendRequestsUsecaseInput extends Input {
  final String userId;
  GetReceivedFriendRequestsUsecaseInput({required this.userId});
}

class GetReceivedFriendRequestsUsecaseOutput extends Output {
  final Stream<List<UserRequestEntity>> _friendsRequest;

  Stream<List<UserRequest>> get friendsRequests => _friendsRequest.map(
        (requests) => requests.map((e) => UserRequest.fromEntity(e)).toList(),
      );

  GetReceivedFriendRequestsUsecaseOutput(
      {required Stream<List<UserRequestEntity>> friendRequests})
      : _friendsRequest = friendRequests;
}

@lazySingleton
class GetReceivedFriendRequestsUsecase {
  final FriendsRepository _friendsRepository;

  GetReceivedFriendRequestsUsecase(
      {required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  GetReceivedFriendRequestsUsecaseOutput call(
      GetReceivedFriendRequestsUsecaseInput input) {
    return _friendsRepository.getReceivedFriendRequests(input);
  }
}
