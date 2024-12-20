import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class VerifyOtpUsecaseInput extends Input {
  final String otp;

  VerifyOtpUsecaseInput({required this.otp});
}

class VerifyOtpUsecaseOutput extends Output {
  final String id;

  VerifyOtpUsecaseOutput({required this.id});
}

@lazySingleton
class VerifyOtpUsecase
    extends Usecase<VerifyOtpUsecaseInput, VerifyOtpUsecaseOutput> {
  final AuthRepository _authRepository;

  VerifyOtpUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<VerifyOtpUsecaseOutput> call(VerifyOtpUsecaseInput input) async {
    return await _authRepository.verifyOtp(input);
  }
}
