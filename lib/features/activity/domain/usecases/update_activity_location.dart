import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/activity_repository.dart';

class UpdateActivityLocationUsecaseInput extends Input {
  final double lat;
  final double lng;
  final String activityId;

  UpdateActivityLocationUsecaseInput({
    required this.lat,
    required this.lng,
    required this.activityId,
  });
}

class UpdateActivityLocationUsecaseOutput extends Output {
  UpdateActivityLocationUsecaseOutput();
}

@lazySingleton
class UpdateActivityLocationUsecase extends Usecase<
    UpdateActivityLocationUsecaseInput, UpdateActivityLocationUsecaseOutput> {
  final ActivityRepository _activityRepository;

  UpdateActivityLocationUsecase(
      {required ActivityRepository activityRepository})
      : _activityRepository = activityRepository;

  @override
  Future<UpdateActivityLocationUsecaseOutput> call(
      UpdateActivityLocationUsecaseInput input) async {
    return await _activityRepository.updateActivityLocation(input);
  }
}
