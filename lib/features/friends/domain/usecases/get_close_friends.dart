import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../../../auth/data/entities/user/user.dart';
import '../../../auth/domain/models/user/user.dart';
import '../repository/friends_repository.dart';

class GetCloseFriendsUsecaseInput extends Input {
  final String userId;

  GetCloseFriendsUsecaseInput({required this.userId});
}

class GetCloseFriendsUsecaseOutput extends Output {
  final Stream<List<UserEntity>> _friends;

  Stream<List<User>> get friends => _friends.map(
        (users) => users.map((e) => User.fromEntity(e)).toList(),
      );

  GetCloseFriendsUsecaseOutput({required Stream<List<UserEntity>> friends})
      : _friends = friends;
}

@lazySingleton
class GetCloseFriendsUsecase {
  final FriendsRepository _friendsRepository;

  GetCloseFriendsUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  GetCloseFriendsUsecaseOutput call(GetCloseFriendsUsecaseInput input) {
    return _friendsRepository.getCloseFriends(input);
  }
}
