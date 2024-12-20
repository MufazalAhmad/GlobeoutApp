import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class CheckAuthUsecaseInput extends Input {
  CheckAuthUsecaseInput();
}

class CheckAuthUsecaseOutput extends Output {
  final String? userId;

  CheckAuthUsecaseOutput({required this.userId});
}

@lazySingleton
class CheckAuthUsecase
    extends Usecase<CheckAuthUsecaseInput, CheckAuthUsecaseOutput> {
  final AuthRepository _authRepository;

  CheckAuthUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<CheckAuthUsecaseOutput> call(CheckAuthUsecaseInput input) async {
    return await _authRepository.checkAuth(input);
  }
}
