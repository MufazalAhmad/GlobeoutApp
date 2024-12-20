import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class FollowUserUsecaseInput extends Input {
  final String fromUserId;
  final String toUserId;

  FollowUserUsecaseInput({
    required this.fromUserId,
    required this.toUserId,
  });
}

class FollowUserUsecaseOutput extends Output {
  FollowUserUsecaseOutput();
}

@lazySingleton
class FollowUserUsecase
    extends Usecase<FollowUserUsecaseInput, FollowUserUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  FollowUserUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<FollowUserUsecaseOutput> call(FollowUserUsecaseInput input) async {
    return await _friendsRepository.followUser(input);
  }
}
