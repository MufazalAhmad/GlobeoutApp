import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/friends/domain/usecases/load_contacts.dart';
import 'package:globout/util/di/di.dart';

final contactsProvider = FutureProvider<List<String>>((ref) async {
  final loadContacts = sl<LoadContactsUsecase>();
  final output = await loadContacts(LoadContactsUsecaseInput());
  return output.numbers;
});
