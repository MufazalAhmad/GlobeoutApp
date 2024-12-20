import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class UnfollowUserUsecaseInput extends Input {
  final String fromUserId;
  final String toUserId;

  UnfollowUserUsecaseInput({
    required this.fromUserId,
    required this.toUserId,
  });
}

class UnfollowUserUsecaseOutput extends Output {
  UnfollowUserUsecaseOutput();
}

@lazySingleton
class UnfollowUserUsecase
    extends Usecase<UnfollowUserUsecaseInput, UnfollowUserUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  UnfollowUserUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<UnfollowUserUsecaseOutput> call(UnfollowUserUsecaseInput input) async {
    return await _friendsRepository.unfollowUser(input);
  }
}
