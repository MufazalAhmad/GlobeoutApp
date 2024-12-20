import '../../../data/entities/user/user.dart';

class User {
  final String id;
  final String phNumber;
  final String? name;
  final bool initialInvitesSent;
  final String imgUrl;
  final bool? added;
  final String createdAt;
  final String updatedAt;
  final String? photoUrl;
  final String? email;
  final String? username;
  final bool visible;
  final List<String> friends;
  final List<String> closeFriends;

  User({
    required this.id,
    required this.phNumber,
    required this.name,
    required this.initialInvitesSent,
    required this.imgUrl,
    this.added,
    required this.createdAt,
    required this.updatedAt,
    required this.photoUrl,
    this.email,
    this.username,
    this.visible = true,
    this.friends = const <String>[],
    this.closeFriends = const <String>[],
  });

  User copyWith({
    String? id,
    String? phNumber,
    String? name,
    bool? initialInvitesSent,
    String? imgUrl,
    bool? added,
    String? email,
    String? username,
    bool? visible,
    List<String>? friends,
    List<String>? closeFriends,
  }) {
    return User(
      id: id ?? this.id,
      phNumber: phNumber ?? this.phNumber,
      name: name ?? this.name,
      initialInvitesSent: initialInvitesSent ?? this.initialInvitesSent,
      imgUrl: imgUrl ?? this.imgUrl,
      added: added ?? this.added,
      updatedAt: updatedAt,
      createdAt: createdAt,
      photoUrl: photoUrl,
      email: email ?? this.email,
      username: username ?? this.username,
      visible: visible ?? this.visible,
      friends: friends ?? this.friends,
      closeFriends: closeFriends ?? this.closeFriends,
    );
  }

  factory User.fromEntity(UserEntity entity) {
    return User(
      id: entity.id,
      phNumber: entity.phNumber,
      name: entity.name,
      initialInvitesSent: entity.initialInvitesSent,
      imgUrl: entity.imgUrl,
      username: entity.username,
      email: entity.email,
      added: entity.added,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      photoUrl: entity.photoUrl,
      visible: entity.visible ?? true,
      friends: entity.friends ?? [],
      closeFriends: entity.closeFriends ?? [],
    );
  }

  bool get hasName => name != null && name!.isNotEmpty;

  @override
  bool operator ==(Object other) {
    return other is User &&
        id == other.id &&
        phNumber == other.phNumber &&
        name == other.name &&
        initialInvitesSent == other.initialInvitesSent &&
        imgUrl == other.imgUrl &&
        added == other.added &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        photoUrl == other.photoUrl &&
        visible == other.visible &&
        friends.length == other.friends.length &&
        friends.toSet().difference(other.friends.toSet()).isEmpty &&
        closeFriends.length == other.closeFriends.length &&
        closeFriends.toSet().difference(other.closeFriends.toSet()).isEmpty;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        phNumber.hashCode ^
        name.hashCode ^
        initialInvitesSent.hashCode ^
        imgUrl.hashCode ^
        added.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        photoUrl.hashCode ^
        visible.hashCode ^
        friends.hashCode ^
        closeFriends.hashCode;
  }
}
