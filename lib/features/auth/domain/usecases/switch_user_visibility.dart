import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class SwitchUserVisibilityUsecaseInput extends Input {
  final String userId;
  final bool visible;

  SwitchUserVisibilityUsecaseInput({
    required this.userId,
    required this.visible,
  });
}

class SwitchUserVisibilityUsecaseOutput extends Output {
  SwitchUserVisibilityUsecaseOutput();
}

@lazySingleton
class SwitchUserVisibilityUsecase extends Usecase<
    SwitchUserVisibilityUsecaseInput, SwitchUserVisibilityUsecaseOutput> {
  final AuthRepository _authRepository;

  SwitchUserVisibilityUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<SwitchUserVisibilityUsecaseOutput> call(
      SwitchUserVisibilityUsecaseInput input) async {
    return await _authRepository.switchUserVisibility(input);
  }
}
