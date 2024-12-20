// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirebaseEventEntity _$$_FirebaseEventEntityFromJson(
        Map<String, dynamic> json) =>
    _$_FirebaseEventEntity(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      userId: json['userId'] as String,
      activities: (json['activities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      inMinutes: json['inMinutes'] as int,
      forHours: json['forHours'] as int,
      forAllFriends: json['forAllFriends'] as bool,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      updatedTime: json['updatedTime'] as String,
      user: FirebaseUserEntity.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FirebaseEventEntityToJson(
        _$_FirebaseEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'userId': instance.userId,
      'activities': instance.activities,
      'inMinutes': instance.inMinutes,
      'forHours': instance.forHours,
      'forAllFriends': instance.forAllFriends,
      'lat': instance.lat,
      'lng': instance.lng,
      'updatedTime': instance.updatedTime,
      'user': instance.user,
    };
