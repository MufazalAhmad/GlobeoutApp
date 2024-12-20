import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class AddFriendUsecaseInput extends Input {
  final String friendId;
  final String userId;

  AddFriendUsecaseInput({
    required this.friendId,
    required this.userId,
  });
}

class AddFriendUsecaseOutput extends Output {
  AddFriendUsecaseOutput();
}

@lazySingleton
class AddFriendUsecase
    extends Usecase<AddFriendUsecaseInput, AddFriendUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  AddFriendUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<AddFriendUsecaseOutput> call(AddFriendUsecaseInput input) async {
    return await _friendsRepository.addFriend(input);
  }
}
