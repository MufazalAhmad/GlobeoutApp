import 'package:globout/features/auth/data/entities/user/user.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../../../auth/domain/models/user/user.dart';
import '../repository/friends_repository.dart';

class GetAllFriendsUsecaseInput extends Input {
  final String userId;

  GetAllFriendsUsecaseInput({required this.userId});
}

class GetAllFriendsUsecaseOutput extends Output {
  final Stream<List<UserEntity>> _friends;

  Stream<List<User>> get friends => _friends.map(
        (users) => users.map((e) => User.fromEntity(e)).toList(),
      );

  GetAllFriendsUsecaseOutput({required Stream<List<UserEntity>> friends})
      : _friends = friends;
}

@lazySingleton
class GetAllFriendsUsecase {
  final FriendsRepository _friendsRepository;

  GetAllFriendsUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  GetAllFriendsUsecaseOutput call(GetAllFriendsUsecaseInput input) {
    return _friendsRepository.getAllFriends(input);
  }
}
