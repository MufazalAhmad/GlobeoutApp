// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRequestEntity _$$_UserRequestEntityFromJson(Map<String, dynamic> json) =>
    _$_UserRequestEntity(
      id: json['id'] as String,
      user: FirebaseUserEntity.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserRequestEntityToJson(
        _$_UserRequestEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
    };
