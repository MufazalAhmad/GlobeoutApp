import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:globout/features/auth/data/entities/user/firebase_user/firebase_user_entity.dart';
part 'user_request_entity.freezed.dart';
part 'user_request_entity.g.dart';

@freezed
class UserRequestEntity with _$UserRequestEntity {
  const factory UserRequestEntity({
    required String id,
    required FirebaseUserEntity user,
  }) = _UserRequestEntity;

  factory UserRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$UserRequestEntityFromJson(json);
}
