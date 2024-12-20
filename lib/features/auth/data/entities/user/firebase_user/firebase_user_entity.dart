import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:globout/features/auth/data/entities/user/user.dart';

part 'firebase_user_entity.freezed.dart';

part 'firebase_user_entity.g.dart';

@freezed
class FirebaseUserEntity with _$FirebaseUserEntity implements UserEntity {
  const factory FirebaseUserEntity({
    required String id,
    required String? name,
    required String phNumber,
    required String? photoUrl,
    required String createdAt,
    required String updatedAt,
    required bool initialInvitesSent,
    required String imgUrl,
    required bool? added,
    required String? email,
    required String? username,
    required bool? visible,
    required List<String>? friends,
    required List<String>? closeFriends,
  }) = _FirebaseUserEntity;

  factory FirebaseUserEntity.fromJson(Map<String, dynamic> json) =>
      _$FirebaseUserEntityFromJson(json);
}
