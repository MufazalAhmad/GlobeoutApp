import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class RemoveContactsUsecaseInput extends Input {
  RemoveContactsUsecaseInput();
}

class RemoveContactsUsecaseOutput extends Output {
  RemoveContactsUsecaseOutput();
}

@lazySingleton
class RemoveContactsUsecase extends Usecase<RemoveContactsUsecaseInput, RemoveContactsUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  RemoveContactsUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<RemoveContactsUsecaseOutput> call(
      RemoveContactsUsecaseInput input) async {
        return await _friendsRepository.removeContacts(input);
     }
}
