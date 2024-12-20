import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class UnFriendUsecaseInput extends Input {
  final String userId;
  final String friendId;
  UnFriendUsecaseInput({
    required this.userId,
    required this.friendId,
  });
}

class UnFriendUsecaseOutput extends Output {
  UnFriendUsecaseOutput();
}

@lazySingleton
class UnFriendUsecase
    extends Usecase<UnFriendUsecaseInput, UnFriendUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  UnFriendUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<UnFriendUsecaseOutput> call(UnFriendUsecaseInput input) async {
    return await _friendsRepository.unFriend(input);
  }
}
