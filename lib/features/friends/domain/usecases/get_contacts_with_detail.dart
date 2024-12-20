import 'package:globout/features/friends/domain/models/contact/contact.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../../data/entities/contact/contact_entity.dart';
import '../repository/friends_repository.dart';

class GetContactsWithDetailUsecaseInput extends Input {
  GetContactsWithDetailUsecaseInput();
}

class GetContactsWithDetailUsecaseOutput extends Output {
  List<ContactModel> contacts;
  GetContactsWithDetailUsecaseOutput(
      {required List<ContactEntity> contactEntities})
      : contacts =
            contactEntities.map((e) => ContactModel.fromEntity(e)).toList();
}

@lazySingleton
class GetContactsWithDetailUsecase extends Usecase<
    GetContactsWithDetailUsecaseInput, GetContactsWithDetailUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  GetContactsWithDetailUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<GetContactsWithDetailUsecaseOutput> call(
      GetContactsWithDetailUsecaseInput input) async {
    return await _friendsRepository.getContactsWithDetail(input);
  }
}
