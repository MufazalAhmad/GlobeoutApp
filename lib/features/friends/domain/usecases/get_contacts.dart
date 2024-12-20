import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class GetContactsUsecaseInput extends Input {
  GetContactsUsecaseInput();
}

class GetContactsUsecaseOutput extends Output {
  final List<String> numbers;

  GetContactsUsecaseOutput({required this.numbers});
}

@lazySingleton
class GetContactsUsecase
    extends Usecase<GetContactsUsecaseInput, GetContactsUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  GetContactsUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<GetContactsUsecaseOutput> call(GetContactsUsecaseInput input) async {
    return await _friendsRepository.getContacts(input);
  }
}
