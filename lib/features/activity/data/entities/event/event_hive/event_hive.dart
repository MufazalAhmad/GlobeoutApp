import 'package:globout/features/auth/data/entities/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../event.dart';

part 'event_hive.g.dart';

@HiveType(typeId: 1) // Specify a unique type ID for the Hive type.
class HiveEventEntity extends HiveObject implements EventEntity {
  @override
  @HiveField(0)
  final String createdAt;

  @override
  @HiveField(1)
  final String userId;

  @override
  @HiveField(2)
  final List<String> activities;

  @override
  @HiveField(3)
  final int inMinutes;

  @override
  @HiveField(4)
  final int forHours;

  @override
  @HiveField(5)
  final bool forAllFriends;

  @override
  @HiveField(6)
  final double lat;

  @override
  @HiveField(7)
  final double lng;

  @override
  @HiveField(9)
  final String updatedTime;

  @override
  @HiveField(10)
  final String id;

  @override
  @HiveField(11)
  final UserEntity user;

  HiveEventEntity({
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
