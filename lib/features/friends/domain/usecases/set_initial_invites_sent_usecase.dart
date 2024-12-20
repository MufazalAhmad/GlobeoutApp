import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class SetInitialInvitesSentUsecaseUsecaseInput extends Input {
  final String userId;

  SetInitialInvitesSentUsecaseUsecaseInput({required this.userId});
}

class SetInitialInvitesSentUsecaseUsecaseOutput extends Output {
  SetInitialInvitesSentUsecaseUsecaseOutput();
}

@lazySingleton
class SetInitialInvitesSentUsecaseUsecase extends Usecase<
    SetInitialInvitesSentUsecaseUsecaseInput,
    SetInitialInvitesSentUsecaseUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  SetInitialInvitesSentUsecaseUsecase(
      {required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<SetInitialInvitesSentUsecaseUsecaseOutput> call(
      SetInitialInvitesSentUsecaseUsecaseInput input) async {
    return await _friendsRepository.setInitialInvitesSent(input);
  }
}
