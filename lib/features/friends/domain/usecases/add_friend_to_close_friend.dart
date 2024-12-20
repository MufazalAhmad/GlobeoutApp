import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class AddFriendToCloseFriendUsecaseInput extends Input {
  final String friendId;
  final String userId;

  AddFriendToCloseFriendUsecaseInput({
    required this.friendId,
    required this.userId,
  });
}

class AddFriendToCloseFriendUsecaseOutput extends Output {
  AddFriendToCloseFriendUsecaseOutput();
}

@lazySingleton
class AddFriendToCloseFriendUsecase extends Usecase<
    AddFriendToCloseFriendUsecaseInput, AddFriendToCloseFriendUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  AddFriendToCloseFriendUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<AddFriendToCloseFriendUsecaseOutput> call(
      AddFriendToCloseFriendUsecaseInput input) async {
    return await _friendsRepository.addFriendToCloseFriend(input);
  }
}
