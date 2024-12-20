import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../models/event.dart';
import '../repository/activity_repository.dart';

class GetEventsCachedUsecaseInput extends Input {
  GetEventsCachedUsecaseInput();
}

class GetEventsCachedUsecaseOutput extends Output {
  List<EventModel> events;
  GetEventsCachedUsecaseOutput({required this.events});
}

@lazySingleton
class GetEventsCachedUsecase
    extends Usecase<GetEventsCachedUsecaseInput, GetEventsCachedUsecaseOutput> {
  final ActivityRepository _activityRepository;

  GetEventsCachedUsecase({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository;

  @override
  Future<GetEventsCachedUsecaseOutput> call(
      GetEventsCachedUsecaseInput input) async {
    return await _activityRepository.getCachedEvents(input);
  }
}
