import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class PhoneContactsUpdatedUsecaseInput extends Input {
  PhoneContactsUpdatedUsecaseInput();
}

class PhoneContactsUpdatedUsecaseOutput extends Output {
  final StreamController<bool> onChanged;

  PhoneContactsUpdatedUsecaseOutput({required this.onChanged});
}

@lazySingleton
class PhoneContactsUpdatedUsecase extends Usecase<
    PhoneContactsUpdatedUsecaseInput, PhoneContactsUpdatedUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  PhoneContactsUpdatedUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<PhoneContactsUpdatedUsecaseOutput> call(
      PhoneContactsUpdatedUsecaseInput input) async {
    return await _friendsRepository.phoneContactsUpdated(input);
  }
}
