import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_entity.freezed.dart';

part 'friend_entity.g.dart';

@freezed
class FriendEntity with _$FriendEntity {
  const factory FriendEntity({
    required String id,
    required List<String> members,
    required bool requestApproved,
    required String requestSentBy,
    required String requestSentTo,
  }) = _FriendEntity;

  factory FriendEntity.fromJson(Map<String, dynamic> json) =>
      _$FriendEntityFromJson(json);
}
