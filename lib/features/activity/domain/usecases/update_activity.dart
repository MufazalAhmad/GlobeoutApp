import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/activity_repository.dart';

class UpdateActivityUsecaseInput extends Input {
  final String id;

  UpdateActivityUsecaseInput({required this.id});
}

class UpdateActivityUsecaseOutput extends Output {
  UpdateActivityUsecaseOutput();
}

@lazySingleton
class UpdateActivityUsecase
    extends Usecase<UpdateActivityUsecaseInput, UpdateActivityUsecaseOutput> {
  final ActivityRepository _activityRepository;

  UpdateActivityUsecase({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository;

  @override
  Future<UpdateActivityUsecaseOutput> call(
      UpdateActivityUsecaseInput input) async {
    return await _activityRepository.updateActivity(input);
  }
}
