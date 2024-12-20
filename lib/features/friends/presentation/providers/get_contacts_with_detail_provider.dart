import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/friends/domain/models/contact/contact.dart';
import 'package:globout/features/friends/domain/usecases/get_contacts_with_detail.dart';
import 'package:globout/util/di/di.dart';

final contactsWithDetailProvider =
    FutureProvider.autoDispose<List<ContactModel>>((ref) async {
  final getContacts = sl<GetContactsWithDetailUsecase>();
  final output = await getContacts(GetContactsWithDetailUsecaseInput());
  return output.contacts;
});
