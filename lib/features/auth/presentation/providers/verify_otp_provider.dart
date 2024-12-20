import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/usecases/get_user.dart';
import 'package:globout/features/auth/domain/usecases/verify_otp.dart';
import 'package:globout/features/auth/presentation/providers/save_auth_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/util/di/di.dart';

final verifyOtpProvider =
    FutureProvider.autoDispose.family<void, String>((ref, otp) async {
  final verifyOtp = sl<VerifyOtpUsecase>();
  final getUser = sl<GetUserUsecase>();

  if (otp.trim().length != 6) {
    throw "Invalid OTP";
  }

  final verifyInput = VerifyOtpUsecaseInput(otp: otp);
  final output = await verifyOtp(verifyInput);

  final getUserInput = GetUserUsecaseInput(id: output.id);
  final getUserOutput = await getUser(getUserInput);

  ref.read(userProvider.notifier).setUser(getUserOutput.user);

  if (getUserOutput.user.name != null) {
    await ref.read(saveAuthProvider.future);
  }
});
