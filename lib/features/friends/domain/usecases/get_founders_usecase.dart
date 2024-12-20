import 'package:globout/features/friends/domain/models/founder/founder.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/friends_repository.dart';

class GetFoundersUsecaseUsecaseInput extends Input {
  GetFoundersUsecaseUsecaseInput();
}

class GetFoundersUsecaseUsecaseOutput extends Output {
  final List<Founder> founders;

  GetFoundersUsecaseUsecaseOutput({
    required this.founders,
  });
}

@lazySingleton
class GetFoundersUsecaseUsecase extends Usecase<GetFoundersUsecaseUsecaseInput,
    GetFoundersUsecaseUsecaseOutput> {
  final FriendsRepository _friendsRepository;

  GetFoundersUsecaseUsecase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;

  @override
  Future<GetFoundersUsecaseUsecaseOutput> call(
      GetFoundersUsecaseUsecaseInput input) async {
    return await _friendsRepository.getFounders(input);
  }
}
