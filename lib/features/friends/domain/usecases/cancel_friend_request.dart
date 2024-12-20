import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class CancelFriendRequestUsecaseInput extends Input {
  final String requestId;
  CancelFriendRequestUsecaseInput({required this.requestId});
}

class CancelFriendRequestUsecaseOutput extends Output {
  CancelFriendRequestUsecaseOutput();
}

@lazySingleton
class CancelFriendRequestUsecase extends Usecase<
    CancelFriendRequestUsecaseInput, CancelFriendRequestUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  CancelFriendRequestUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<CancelFriendRequestUsecaseOutput> call(
      CancelFriendRequestUsecaseInput input) async {
    return await _friendsRepository.cancelFriendRequest(input);
  }
}
