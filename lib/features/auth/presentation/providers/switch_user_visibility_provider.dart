import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/presentation/providers/my_events_visibility_provider.dart';
import 'package:globout/features/auth/domain/usecases/switch_user_visibility.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/util/di/di.dart';

final switchUserVisibilityProvider = FutureProvider((ref) async {
  final user = ref.watch(userProvider);
  final visible = ref.watch(myEventsVisibilityProvider);

  final updateUserVisibility = sl<SwitchUserVisibilityUsecase>();
  final input =
      SwitchUserVisibilityUsecaseInput(userId: user!.id, visible: visible);

  await updateUserVisibility(input);
});
