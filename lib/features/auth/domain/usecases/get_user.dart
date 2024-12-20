import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../models/user/user.dart';
import '../repository/auth_repository.dart';

class GetUserUsecaseInput extends Input {
  final String id;

  GetUserUsecaseInput({required this.id});
}

class GetUserUsecaseOutput extends Output {
  final User user;

  GetUserUsecaseOutput({required this.user});
}

@lazySingleton
class GetUserUsecase
    extends Usecase<GetUserUsecaseInput, GetUserUsecaseOutput> {
  final AuthRepository _authRepository;

  GetUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<GetUserUsecaseOutput> call(GetUserUsecaseInput input) async {
    return await _authRepository.getUser(input);
  }
}
