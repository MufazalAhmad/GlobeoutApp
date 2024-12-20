////********** AUTOGENERATED FILE: DO NOT REMOVE ANY COMMENT IN THIS STYLE **********////
////********** START IMPORTS **********////
import '../../../../../infrastructure/datasource.dart';
import '../../../domain/usecases/get_contacts.dart';
import '../../../domain/usecases/phone_contacts_updated.dart';
import '../../../domain/usecases/get_contacts_with_detail.dart';
////********** END IMPORTS **********////

abstract class FriendsPhoneDataSource extends DataSource {
  ////********** START METHODS **********////
  /// [GetContactsUsecaseInput] is received to [getContacts] method as parameter
  /// [GetContactsUsecaseOutput] is returned from [getContacts] method
  Future<GetContactsUsecaseOutput> getContacts(GetContactsUsecaseInput input);


  /// [PhoneContactsUpdatedUsecaseInput] is received to [phoneContactsUpdated] method as parameter
  /// [PhoneContactsUpdatedUsecaseOutput] is returned from [phoneContactsUpdated] method
  Future<PhoneContactsUpdatedUsecaseOutput> phoneContactsUpdated(PhoneContactsUpdatedUsecaseInput input);


  /// [GetContactsWithDetailUsecaseInput] is received to [getContactsWithDetail] method as parameter
  /// [GetContactsWithDetailUsecaseOutput] is returned from [getContactsWithDetail] method
  Future<GetContactsWithDetailUsecaseOutput> getContactsWithDetail(GetContactsWithDetailUsecaseInput input);

////********** END METHODS **********////
}
  