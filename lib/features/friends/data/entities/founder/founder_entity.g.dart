// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'founder_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FounderEntity _$$_FounderEntityFromJson(Map<String, dynamic> json) =>
    _$_FounderEntity(
      id: json['id'] as String,
      imgUrl: json['imgUrl'] as String,
      followers:
          (json['followers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FounderEntityToJson(_$_FounderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'followers': instance.followers,
    };
