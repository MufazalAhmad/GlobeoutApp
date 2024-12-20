import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class RemoveFriendFromCloseFriendsUsecaseInput extends Input {
  final String friendId;
  final String userId;

  RemoveFriendFromCloseFriendsUsecaseInput({
    required this.friendId,
    required this.userId,
  });
}

class RemoveFriendFromCloseFriendsUsecaseOutput extends Output {
  RemoveFriendFromCloseFriendsUsecaseOutput();
}

@lazySingleton
class RemoveFriendFromCloseFriendsUsecase extends Usecase<
    RemoveFriendFromCloseFriendsUsecaseInput,
    RemoveFriendFromCloseFriendsUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  RemoveFriendFromCloseFriendsUsecase(
      {required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<RemoveFriendFromCloseFriendsUsecaseOutput> call(
      RemoveFriendFromCloseFriendsUsecaseInput input) async {
    return await _friendsRepository.removeFriendFromCloseFriends(input);
  }
}
