import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class AcceptFriendRequestUsecaseInput extends Input {
  final String requestId;
  final String sentToId;
  final String sentById;
  AcceptFriendRequestUsecaseInput({
    required this.requestId,
    required this.sentById,
    required this.sentToId,
  });
}

class AcceptFriendRequestUsecaseOutput extends Output {
  AcceptFriendRequestUsecaseOutput();
}

@lazySingleton
class AcceptFriendRequestUsecase extends Usecase<
    AcceptFriendRequestUsecaseInput, AcceptFriendRequestUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  AcceptFriendRequestUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<AcceptFriendRequestUsecaseOutput> call(
      AcceptFriendRequestUsecaseInput input) async {
    return await _friendsRepository.acceptFriendRequest(input);
  }
}
