import 'package:globout/features/auth/data/entities/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hive_user.g.dart';

@HiveType(typeId: 3)
class HiveUserEntity extends HiveObject implements UserEntity {
  @override
  @HiveField(1)
  final bool? added;

  @override
  @HiveField(2)
  final String createdAt;

  @override
  @HiveField(3)
  final String id;

  @override
  @HiveField(4)
  final String imgUrl;

  @override
  @HiveField(5)
  final bool initialInvitesSent;

  @override
  @HiveField(6)
  final String? name;

  @override
  @HiveField(7)
  final String phNumber;

  @override
  @HiveField(8)
  final String? photoUrl;

  @override
  @HiveField(9)
  final String updatedAt;

  @override
  @HiveField(10)
  final String? email;

  @override
  @HiveField(11)
  final String? username;

  @override
  @HiveField(12)
  final bool? visible;

  @override
  @HiveField(13)
  final List<String>? friends;

  @override
  @HiveField(14)
  final List<String>? closeFriends;

  HiveUserEntity({
    required this.added,
    required this.createdAt,
    required this.id,
    required this.imgUrl,
    required this.initialInvitesSent,
    required this.name,
    required this.phNumber,
    required this.photoUrl,
    required this.updatedAt,
    required this.email,
    required this.username,
    required this.visible,
    required this.friends,
    required this.closeFriends,
  });
}
