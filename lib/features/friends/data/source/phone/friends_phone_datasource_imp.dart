import 'dart:async';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:globout/features/friends/data/entities/contact/contact_entity.dart';
import 'package:globout/features/friends/domain/usecases/get_contacts.dart';
import 'package:globout/features/friends/domain/usecases/get_contacts_with_detail.dart';
import 'package:globout/features/friends/domain/usecases/phone_contacts_updated.dart';
import 'package:injectable/injectable.dart';

import 'friends_phone_datasource.dart';

@LazySingleton(as: FriendsPhoneDataSource)
class FriendsPhoneDataSourceImp implements FriendsPhoneDataSource {
  @override
  Future<GetContactsUsecaseOutput> getContacts(
      GetContactsUsecaseInput input) async {
    try {
      final contacts = await FlutterContacts.getContacts(
          withAccounts: true, withProperties: true);

      final listOfPhones = <String>[
        for (final contact in contacts)
          ...contact.phones.map((e) => e.normalizedNumber),
      ];
      return GetContactsUsecaseOutput(
        numbers: listOfPhones,
      );
    } catch (e) {
      throw "Something went wrong while fetching contacts";
    }
  }

  @override
  Future<PhoneContactsUpdatedUsecaseOutput> phoneContactsUpdated(
      PhoneContactsUpdatedUsecaseInput input) async {
    final contactsUpdated = StreamController<bool>.broadcast();

    FlutterContacts.addListener(() {
      contactsUpdated.add(true);
    });

    return PhoneContactsUpdatedUsecaseOutput(onChanged: contactsUpdated);
  }

  @override
  Future<GetContactsWithDetailUsecaseOutput> getContactsWithDetail(
      GetContactsWithDetailUsecaseInput input) async {
    try {
      final contacts = await FlutterContacts.getContacts(
          withAccounts: true, withProperties: true);

      final List<ContactEntity> listOfPhones = [];
      for (final contact in contacts) {
        listOfPhones.add(
          ContactEntity(
            name: contact.displayName,
            phones: contact.phones.map((e) => e.number).toList(),
          ),
        );
      }
      return GetContactsWithDetailUsecaseOutput(
        contactEntities: listOfPhones,
      );
    } catch (e) {
      throw "Something went wrong while fetching contacts";
    }
  }
}
