import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/usecases/check_auth.dart';
import 'package:globout/features/auth/domain/usecases/get_user.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/util/di/di.dart';

final checkAuthProvider = FutureProvider.autoDispose<bool>((ref) async {
  final checkAuth = sl<CheckAuthUsecase>();
  final getUser = sl<GetUserUsecase>();

  final checkAuthOutput = await checkAuth(CheckAuthUsecaseInput());

  if (checkAuthOutput.userId == null) {
    return false;
  }

  final getUserInput = GetUserUsecaseInput(id: checkAuthOutput.userId!);
  final getUserOutput = await getUser(getUserInput);

  ref.read(userProvider.notifier).setUser(getUserOutput.user);

  return true;
});
