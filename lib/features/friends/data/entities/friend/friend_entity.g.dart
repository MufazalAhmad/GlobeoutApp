// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FriendEntity _$$_FriendEntityFromJson(Map<String, dynamic> json) =>
    _$_FriendEntity(
      id: json['id'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      requestApproved: json['requestApproved'] as bool,
      requestSentBy: json['requestSentBy'] as String,
      requestSentTo: json['requestSentTo'] as String,
    );

Map<String, dynamic> _$$_FriendEntityToJson(_$_FriendEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'members': instance.members,
      'requestApproved': instance.requestApproved,
      'requestSentBy': instance.requestSentBy,
      'requestSentTo': instance.requestSentTo,
    };
