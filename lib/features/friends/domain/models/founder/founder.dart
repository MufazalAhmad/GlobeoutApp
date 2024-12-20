import 'package:globout/features/friends/data/entities/founder/founder_entity.dart';

class Founder {
  final String id;
  final String imgUrl;
  final List<String> followers;

  Founder({
    required this.id,
    required this.imgUrl,
    required this.followers,
  });

  factory Founder.fromEntity(FounderEntity entity) {
    return Founder(
      id: entity.id,
      imgUrl: entity.imgUrl,
      followers: entity.followers,
    );
  }

  Founder copyWith({
    String? id,
    String? imgUrl,
    List<String>? followers,
  }) {
    return Founder(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      followers: followers ?? this.followers,
    );
  }

  bool isFollowed(String userId) => followers.contains(userId);
}
