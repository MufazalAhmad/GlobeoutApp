import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/usecases/send_otp.dart';
import 'package:globout/util/di/di.dart';
import 'package:globout/util/exceptions/exceptions.dart';

import '../../domain/models/auth_form_step/auth_form_step.dart';
import 'auth_form_model_provider.dart';
import 'auth_form_step_provider.dart';
import 'selected_country_provider.dart';

final loginProvider = FutureProvider.autoDispose<void>((ref) async {
  final selectedCountry = ref.watch(selectedCountryProvider);
  final phoneNumber = ref.watch(authFormModelProvider).phNumber;

  /// If phone number is null or empty, throw an PhoneFormatException
  if (phoneNumber == null || phoneNumber.isEmpty) {
    throw PhoneNumberFormatException();
  }

  if (phoneNumber.contains(RegExp(r'[^0-9]'))) {
    throw PhoneNumberFormatException();
  }

  if (selectedCountry == null) {
    throw Exception('Country not selected');
  }

  final sendOtp = sl<SendOtpUsecase>();
  final input =
      SendOtpUsecaseInput(phNumber: "${selectedCountry.code}$phoneNumber");
  await sendOtp(input);

  ref.read(authFormStepProvider.notifier).setStep(AuthFormStep.enterOTP);
});

final pr = StateProvider<int>((ref) => 0);

f(WidgetRef ref) {
  ref.read(pr.notifier).state = 2;
}
