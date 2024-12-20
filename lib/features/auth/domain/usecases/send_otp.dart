import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class SendOtpUsecaseInput extends Input {
  final String phNumber;

  SendOtpUsecaseInput({required this.phNumber});
}

class SendOtpUsecaseOutput extends Output {
  SendOtpUsecaseOutput();
}

@lazySingleton
class SendOtpUsecase
    extends Usecase<SendOtpUsecaseInput, SendOtpUsecaseOutput> {
  final AuthRepository _authRepository;

  SendOtpUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<SendOtpUsecaseOutput> call(SendOtpUsecaseInput input) async {
    return await _authRepository.sendOtp(input);
  }
}
