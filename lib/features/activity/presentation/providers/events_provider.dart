import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/domain/usecases/get_events.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/home/presentation/providers/event_models_provider.dart';

import '../../../../util/di/di.dart';

final getEventsProvider = StreamProvider<List<EventModel>>((ref) async* {
  final user = ref.watch(userProvider);
  final getEvents = sl<GetEventsUsecase>();

  final input = GetEventsUsecaseInput(
    userId: user!.id,
  );

  final notifier = ref.read(eventModelsProvider.notifier);

  final eventsOutput = getEvents(input);

  final subscription = eventsOutput.events.listen((events) {
    notifier.setAll(events);
  });

  ref.onDispose(() {
    subscription.cancel();
  });
});
