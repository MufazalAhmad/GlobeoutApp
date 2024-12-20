import 'package:globout/features/activity/data/entities/event/event.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/activity_repository.dart';

class GetEventsUsecaseInput extends Input {
  final String userId;

  GetEventsUsecaseInput({
    required this.userId,
  });
}

class GetEventsUsecaseOutput extends Output {
  final Stream<List<EventEntity>> _events;

  Stream<List<EventModel>> get events => _events.map(
        (event) => event.map((e) => EventModel.fromEntity(e)).toList(),
      );

  GetEventsUsecaseOutput({required Stream<List<EventEntity>> events})
      : _events = events;
}

@lazySingleton
class GetEventsUsecase {
  final ActivityRepository _activityRepository;

  GetEventsUsecase({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository;

  GetEventsUsecaseOutput call(GetEventsUsecaseInput input) {
    final events = _activityRepository.getEvents(input);
    return events;
  }
}
