import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class SaveContactsUsecaseInput extends Input {
  final List<String> numbers;

  SaveContactsUsecaseInput({required this.numbers});
}

class SaveContactsUsecaseOutput extends Output {
  SaveContactsUsecaseOutput();
}

@lazySingleton
class SaveContactsUsecase
    extends Usecase<SaveContactsUsecaseInput, SaveContactsUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  SaveContactsUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<SaveContactsUsecaseOutput> call(SaveContactsUsecaseInput input) async {
    return await _friendsRepository.saveContacts(input);
  }
}
