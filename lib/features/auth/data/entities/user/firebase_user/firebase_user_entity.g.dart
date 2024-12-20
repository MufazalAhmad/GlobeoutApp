// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirebaseUserEntity _$$_FirebaseUserEntityFromJson(
        Map<String, dynamic> json) =>
    _$_FirebaseUserEntity(
      id: json['id'] as String,
      name: json['name'] as String?,
      phNumber: json['phNumber'] as String,
      photoUrl: json['photoUrl'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      initialInvitesSent: json['initialInvitesSent'] as bool,
      imgUrl: json['imgUrl'] as String,
      added: json['added'] as bool?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      visible: json['visible'] as bool?,
      friends:
          (json['friends'] as List<dynamic>?)?.map((e) => e as String).toList(),
      closeFriends: (json['closeFriends'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_FirebaseUserEntityToJson(
        _$_FirebaseUserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phNumber': instance.phNumber,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'initialInvitesSent': instance.initialInvitesSent,
      'imgUrl': instance.imgUrl,
      'added': instance.added,
      'email': instance.email,
      'username': instance.username,
      'visible': instance.visible,
      'friends': instance.friends,
      'closeFriends': instance.closeFriends,
    };
