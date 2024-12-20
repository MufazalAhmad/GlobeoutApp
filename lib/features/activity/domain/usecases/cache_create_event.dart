import 'package:globout/features/activity/domain/usecases/create_activity.dart';
import 'package:globout/features/auth/data/entities/user/hive_user/hive_user.dart';
import 'package:globout/features/auth/domain/models/user/user.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../../../auth/data/entities/user/user.dart';
import '../repository/activity_repository.dart';

class CacheCreateEventUsecaseInput extends Output {
  final String id;
  final CreateEventUsecaseInput createEventInput;
  final UserEntity userEntity;

  CacheCreateEventUsecaseInput({
    required this.id,
    required this.createEventInput,
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

class CacheCreateEventUsecaseOutput extends Output {
  CacheCreateEventUsecaseOutput();
}

@lazySingleton
class CacheCreateEventUsecase extends Usecase<CacheCreateEventUsecaseInput,
    CacheCreateEventUsecaseOutput> {
  final ActivityRepository _activityRepository;

  CacheCreateEventUsecase({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository;

  @override
  Future<CacheCreateEventUsecaseOutput> call(
      CacheCreateEventUsecaseInput input) async {
    return await _activityRepository.cacheCreateEvent(input);
  }
}
