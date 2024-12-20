import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class SaveAuthUsecaseInput extends Input {
  final String id;

  SaveAuthUsecaseInput({required this.id});
}

class SaveAuthUsecaseOutput extends Output {
  SaveAuthUsecaseOutput();
}

@lazySingleton
class SaveAuthUsecase
    extends Usecase<SaveAuthUsecaseInput, SaveAuthUsecaseOutput> {
  final AuthRepository _authRepository;

  SaveAuthUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<SaveAuthUsecaseOutput> call(SaveAuthUsecaseInput input) async {
    return await _authRepository.saveAuth(input);
  }
}
