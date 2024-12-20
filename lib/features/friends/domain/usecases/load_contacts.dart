import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class LoadContactsUsecaseInput extends Input {
  LoadContactsUsecaseInput();
}

class LoadContactsUsecaseOutput extends Output {
  final List<String> numbers;

  LoadContactsUsecaseOutput({required this.numbers});
}

@lazySingleton
class LoadContactsUsecase
    extends Usecase<LoadContactsUsecaseInput, LoadContactsUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  LoadContactsUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<LoadContactsUsecaseOutput> call(LoadContactsUsecaseInput input) async {
    return await _friendsRepository.loadContacts(input);
  }
}
