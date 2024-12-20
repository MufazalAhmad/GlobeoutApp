// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactEntity _$$_ContactEntityFromJson(Map<String, dynamic> json) =>
    _$_ContactEntity(
      name: json['name'] as String,
      phones:
          (json['phones'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ContactEntityToJson(_$_ContactEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phones': instance.phones,
    };
