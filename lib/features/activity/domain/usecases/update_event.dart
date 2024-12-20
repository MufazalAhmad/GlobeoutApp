import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/activity_repository.dart';

class UpdateEventUsecaseInput extends Input {
  final String eventId;
  final String userId;
  final int inMinutes;
  final int forHours;
  final bool forAllFriends;
  List<String> activities;
  final double lat;
  final double lng;

  UpdateEventUsecaseInput({
    required this.eventId,
    required this.userId,
    required this.activities,
    required this.inMinutes,
    required this.forHours,
    required this.forAllFriends,
    required this.lat,
    required this.lng,
  });
}

class UpdateEventUsecaseOutput extends Output {
  UpdateEventUsecaseOutput();
}

@lazySingleton
class UpdateEventUsecase
    extends Usecase<UpdateEventUsecaseInput, UpdateEventUsecaseOutput> {
  final ActivityRepository _activityRepository;

  UpdateEventUsecase({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository;

  @override
  Future<UpdateEventUsecaseOutput> call(UpdateEventUsecaseInput input) async {
    return await _activityRepository.updateEvent(input);
  }
}
