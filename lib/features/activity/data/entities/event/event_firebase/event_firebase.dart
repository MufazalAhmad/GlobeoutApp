import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:globout/features/activity/data/entities/event/event.dart';
import 'package:globout/features/auth/data/entities/user/firebase_user/firebase_user_entity.dart';

part 'event_firebase.freezed.dart';

part 'event_firebase.g.dart';

@freezed
class FirebaseEventEntity with _$FirebaseEventEntity implements EventEntity {
  const factory FirebaseEventEntity({
    required final String id,
    required final String createdAt,
    required final String userId,
    required final List<String> activities,
    required final int inMinutes,
    required final int forHours,
    required final bool forAllFriends,
    required final double lat,
    required final double lng,
    required final String updatedTime,
    required final FirebaseUserEntity user,
  }) = _FirebaseEventEntity;

  factory FirebaseEventEntity.fromJson(Map<String, dynamic> json) =>
      _$FirebaseEventEntityFromJson(json);
}
