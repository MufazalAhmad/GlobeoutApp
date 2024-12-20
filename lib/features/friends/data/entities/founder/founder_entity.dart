import 'package:freezed_annotation/freezed_annotation.dart';

part 'founder_entity.freezed.dart';

part 'founder_entity.g.dart';

@freezed
class FounderEntity with _$FounderEntity {
  const factory FounderEntity({
    required String id,
    required String imgUrl,
    required List<String> followers,
  }) = _FounderEntity;

  factory FounderEntity.fromJson(Map<String, dynamic> json) =>
      _$FounderEntityFromJson(json);
}
