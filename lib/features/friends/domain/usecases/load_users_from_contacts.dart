import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../../../auth/domain/models/user/user.dart';
import '../repository/friends_repository.dart';

class LoadUsersFromContactsUsecaseInput extends Input {
  final String userId;
  final List<String> numbers;

  LoadUsersFromContactsUsecaseInput({
    required this.numbers,
    required this.userId,
  });
}

class LoadUsersFromContactsUsecaseOutput extends Output {
  final List<User> users;

  LoadUsersFromContactsUsecaseOutput({required this.users});
}

@lazySingleton
class LoadUsersFromContactsUsecase extends Usecase<
    LoadUsersFromContactsUsecaseInput, LoadUsersFromContactsUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  LoadUsersFromContactsUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<LoadUsersFromContactsUsecaseOutput> call(
      LoadUsersFromContactsUsecaseInput input) async {
    return await _friendsRepository.loadUsersFromContacts(input);
  }
}
