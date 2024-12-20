import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';

import '../../../../util/di/di.dart';
import '../../domain/usecases/update_user.dart';
import 'auth_form_model_provider.dart';

final updateUserProvider = FutureProvider.autoDispose<void>((ref) async {
  final authFormModel = ref.watch(authFormModelProvider);

  if ((authFormModel.name?.length ?? 0) < 3) {
    throw "Name must be at least 3 characters";
  }

  final user = ref.watch(userProvider);

  final updateUser = sl<UpdateUserUsecase>();
  final input = UpdateUserUsecaseInput(
    name: authFormModel.name!,
    id: user!.id,
    email: authFormModel.email,
    username: authFormModel.username,
    image: authFormModel.image,
  );

  final output = await updateUser(input);

  ref.read(userProvider.notifier).setUser(output.user);
});
