import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/usecases/save_auth.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/util/di/di.dart';

final saveAuthProvider = FutureProvider.autoDispose((ref) async {
  final saveAuth = sl<SaveAuthUsecase>();
  final user = ref.watch(userProvider);

  if (user == null) {
    throw Exception('User is null');
  }
  final saveAuthInput = SaveAuthUsecaseInput(id: user.id);
  await saveAuth(saveAuthInput);
});
