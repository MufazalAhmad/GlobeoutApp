abstract class UserEntity {
  final String id;
  final String? name;
  final String phNumber;
  final String? photoUrl;
  final String createdAt;
  final String updatedAt;
  final bool initialInvitesSent;
  final String imgUrl;
  final bool? added;
  final String? email;
  final String? username;
  final bool? visible;
  final List<String>? friends;
  final List<String>? closeFriends;

  UserEntity({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.added,
    required this.imgUrl,
    required this.initialInvitesSent,
    required this.phNumber,
    required this.photoUrl,
    required this.updatedAt,
    required this.email,
    required this.username,
    required this.closeFriends,
    required this.friends,
    required this.visible,
  });
}
