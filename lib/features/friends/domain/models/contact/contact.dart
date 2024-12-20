import '../../../data/entities/contact/contact_entity.dart';

class ContactModel {
  final String name;
  final List<String> phones;

  ContactModel({
    required this.name,
    required this.phones,
  });

  factory ContactModel.fromEntity(ContactEntity contact) {
    return ContactModel(
      name: contact.name,
      phones: contact.phones,
    );
  }
}
