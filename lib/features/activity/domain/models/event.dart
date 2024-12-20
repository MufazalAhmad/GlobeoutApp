import 'dart:typed_data';

import 'package:globout/features/activity/data/entities/event/event.dart';
import 'package:globout/features/auth/domain/models/user/user.dart';
import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String id;
  final String createdAt;
  final String userId;
  final int inMinutes;
  final int forHours;
  final bool forAllFriends;
  final List<String> activities;
  final double lat;
  final double lng;
  final String updatedTime;
  final User user;
  final Uint8List? markerImage;

  const EventModel({
    required this.id,
    required this.createdAt,
    required this.userId,
    required this.activities,
    required this.inMinutes,
    required this.forHours,
    required this.forAllFriends,
    required this.lat,
    required this.lng,
    required this.updatedTime,
    required this.user,
    required this.markerImage,
  });

  EventModel copyWith({
    double? lat,
    double? lng,
    Uint8List? markerImage,
    User? user,
    bool? forAllFriends,
  }) {
    return EventModel(
      id: id,
      createdAt: createdAt,
      userId: userId,
      activities: activities,
      inMinutes: inMinutes,
      forHours: forHours,
      forAllFriends: forAllFriends ?? this.forAllFriends,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      updatedTime: updatedTime,
      user: user ?? this.user,
      markerImage: markerImage ?? this.markerImage,
    );
  }

  factory EventModel.fromEntity(EventEntity entity) {
    return EventModel(
      id: entity.id,
      createdAt: entity.createdAt,
      userId: entity.userId,
      activities: entity.activities,
      inMinutes: entity.inMinutes,
      forHours: entity.forHours,
      forAllFriends: entity.forAllFriends,
      lat: entity.lat,
      lng: entity.lng,
      updatedTime: entity.updatedTime,
      user: User.fromEntity(entity.user),
      markerImage: null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        activities,
        createdAt,
        inMinutes,
        forHours,
        forAllFriends,
        lat,
        lng,
        updatedTime,
        userId,
      ];
}
