import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/friends/domain/usecases/get_contacts.dart';
import 'package:globout/features/friends/domain/usecases/save_contacts.dart';
import 'package:globout/util/di/di.dart';

final contactsSyncProvider = FutureProvider<void>((ref) async {
  final getContacts = sl<GetContactsUsecase>();
  final saveContacts = sl<SaveContactsUsecase>();

  final contactsOutput = await getContacts(GetContactsUsecaseInput());

  final numbers =
      contactsOutput.numbers.where((element) => element.isNotEmpty).toList();
  final numbersList = SaveContactsUsecaseInput(numbers: numbers);
  await saveContacts(numbersList);
});
