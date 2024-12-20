import 'package:globout/features/activity/domain/usecases/update_event.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../../../auth/data/entities/user/hive_user/hive_user.dart';
import '../../../auth/data/entities/user/user.dart';
import '../../../auth/domain/models/user/user.dart';
import '../repository/activity_repository.dart';

class UpdateCachedEventUsecaseInput extends Input {
  final String id;
  final UpdateEventUsecaseInput updateEventInput;
  final UserEntity userEntity;

  UpdateCachedEventUsecaseInput({
    required this.id,
    required this.updateEventInput,
    required User user,
  }) : userEntity = HiveUserEntity(
          added: user.added,
          createdAt: user.createdAt,
          id: user.id,
          imgUrl: user.imgUrl,
          initialInvitesSent: user.initialInvitesSent,
          name: user.name,
          phNumber: user.phNumber,
          photoUrl: user.photoUrl,
          updatedAt: user.updatedAt,
          email: user.email,
          username: user.username,
          visible: user.visible,
          friends: user.friends,
          closeFriends: user.closeFriends,
        );
}

class UpdateCachedEventUsecaseOutput extends Output {
  UpdateCachedEventUsecaseOutput();
}

@lazySingleton
class UpdateCachedEventUsecase extends Usecase<UpdateCachedEventUsecaseInput,
    UpdateCachedEventUsecaseOutput> {
  final ActivityRepository _activityRepository;

  UpdateCachedEventUsecase({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository;

  @override
  Future<UpdateCachedEventUsecaseOutput> call(
      UpdateCachedEventUsecaseInput input) async {
    return await _activityRepository.updateCachedEvent(input);
  }
}
