import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/models/auth_form_step/auth_form_step.dart';

class AuthFormStepProvider extends StateNotifier<AuthFormStep> {
  AuthFormStepProvider() : super(AuthFormStep.enterPhone);

  void setStep(AuthFormStep step) {
    state = step;
  }

  AuthFormStep get step => state;
}

final authFormStepProvider =
    StateNotifierProvider<AuthFormStepProvider, AuthFormStep>((ref) {
  return AuthFormStepProvider();
});
