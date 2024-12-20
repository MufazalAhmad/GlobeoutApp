import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/usecases/remove_auth.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/util/di/di.dart';

final logoutProvider = FutureProvider.autoDispose<void>((ref) async {
  final logout = sl<RemoveAuthUsecase>();
  await logout(RemoveAuthUsecaseInput());

  ref.read(userProvider.notifier).removeUser();
});
