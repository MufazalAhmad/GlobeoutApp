import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/activity_repository.dart';

class CreateEventUsecaseInput extends Input {
  final String userId;
  final int inMinutes;
  final int forHours;
  final bool forAllFriends;
  List<String> activities;
  final double lat;
  final double lng;

  CreateEventUsecaseInput({
    required this.userId,
    required this.activities,
    required this.inMinutes,
    required this.forHours,
    required this.forAllFriends,
    required this.lat,
    required this.lng,
  });
}

class CreateEventUsecaseOutput extends Output {
  final String id;
  CreateEventUsecaseOutput({required this.id});
}

@lazySingleton
class CreateEventUsecase
    extends Usecase<CreateEventUsecaseInput, CreateEventUsecaseOutput> {
  final ActivityRepository _activityRepository;

  CreateEventUsecase({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository;

  @override
  Future<CreateEventUsecaseOutput> call(CreateEventUsecaseInput input) async {
    return await _activityRepository.createActivity(input);
  }
}
