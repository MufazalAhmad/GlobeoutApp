import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class RemoveAuthUsecaseInput extends Input {
  RemoveAuthUsecaseInput();
}

class RemoveAuthUsecaseOutput extends Output {
  RemoveAuthUsecaseOutput();
}

@lazySingleton
class RemoveAuthUsecase extends Usecase<RemoveAuthUsecaseInput, RemoveAuthUsecaseOutput> {
  final AuthRepository _authRepository;

  RemoveAuthUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<RemoveAuthUsecaseOutput> call(
      RemoveAuthUsecaseInput input) async {
        return await _authRepository.removeAuth(input);
     }
}
