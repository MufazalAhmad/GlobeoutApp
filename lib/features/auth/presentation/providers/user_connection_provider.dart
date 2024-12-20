import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/models/user/user.dart';
import 'package:globout/features/auth/domain/usecases/get_user_socket.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/util/di/di.dart';

final userConnectionProvider = StreamProvider<User>((ref) async* {
  final user = ref.watch(userProvider);

  final openConnection = sl<GetUserSocketUsecase>();
  final openConnectionInput = GetUserSocketUsecaseInput(id: user!.id);

  final notifier = ref.read(userProvider.notifier);

  final output = openConnection(openConnectionInput);

  final subscription = output.userConnection.listen((updatedUser) {
    if (updatedUser != user) {
      notifier.setUser(updatedUser);
    }
  });

  ref.onDispose(() {
    subscription.cancel();
  });
});
