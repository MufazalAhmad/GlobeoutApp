import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/home/presentation/providers/event_models_provider.dart';

final currentUserEventProvider = StateProvider<EventModel?>((ref) {
  final user = ref.watch(userProvider);
  final events = ref.watch(eventModelsProvider);

  if (events.any((element) => element.userId == user!.id)) {
    return events.firstWhere((element) => element.userId == user!.id);
  }

  return null;
});
