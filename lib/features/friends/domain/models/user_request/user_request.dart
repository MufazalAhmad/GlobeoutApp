import 'package:globout/features/friends/data/entities/user_request/user_request_entity.dart';

import '../../../../auth/domain/models/user/user.dart';

class UserRequest {
  final String id;
  final User user;

  UserRequest({
    required this.id,
    required this.user,
  });

  factory UserRequest.fromEntity(UserRequestEntity entity) {
    return UserRequest(
      id: entity.id,
      user: User.fromEntity(entity.user),
    );
  }
}
