import 'package:globout/features/auth/data/entities/user/user.dart';

abstract class EventEntity {
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
  final UserEntity user;

  EventEntity({
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
  });
}
