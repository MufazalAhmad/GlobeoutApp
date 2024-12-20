import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_entity.freezed.dart';

part 'contact_entity.g.dart';

@freezed
class ContactEntity with _$ContactEntity {
  const factory ContactEntity({
    required String name,
    required List<String> phones,
  }) = _ContactEntity;

  factory ContactEntity.fromJson(Map<String, dynamic> json) =>
      _$ContactEntityFromJson(json);
}
