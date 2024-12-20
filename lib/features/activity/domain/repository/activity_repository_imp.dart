////********** START IMPORTS **********////
import 'activity_repository.dart';
import 'package:injectable/injectable.dart';
import '../../data/source/remote/activity_remote_datasource.dart';
import '../usecases/update_activity_location.dart';
import '../usecases/create_activity.dart';
import '../../data/source/local/activity_local_datasource.dart';
import '../usecases/cache_create_event.dart';
import '../usecases/get_cached_events.dart';
import '../usecases/get_events.dart';
import '../usecases/update_activity.dart';
import '../usecases/update_event.dart';

import '../usecases/update_cached_event.dart';
////********** END IMPORTS **********////
@LazySingleton(as: ActivityRepository)
class ActivityRepositoryImp implements ActivityRepository {
////********** START VARIABLES **********////
  final ActivityRemoteDataSource _activityRemoteDataSource;
  final ActivityLocalDataSource _activityLocalDataSource;

////********** END VARIABLES **********////

  ActivityRepositoryImp({
////********** START RECEIVE VALUES **********////
    required ActivityRemoteDataSource activityRemoteDataSource,
    required ActivityLocalDataSource activityLocalDataSource,
////********** END RECEIVE VALUES **********////
  })  :
////********** START SET VALUES **********////
        _activityRemoteDataSource = activityRemoteDataSource,
        _activityLocalDataSource = activityLocalDataSource
////********** END SET VALUES **********////
  ;

////********** START METHODS **********////

  /// [UpdateActivityLocationUsecaseInput] is received to [updateActivityLocation] method as parameter
  /// [UpdateActivityLocationUsecaseOutput] is returned from [updateActivityLocation] method
  @override
  Future<UpdateActivityLocationUsecaseOutput> updateActivityLocation(
      UpdateActivityLocationUsecaseInput input) async {
    return _activityRemoteDataSource.updateActivityLocation(input);
  }

  /// [CreateEventUsecaseInput] is received to [createActivity] method as parameter
  /// [CreateEventUsecaseOutput] is returned from [createActivity] method
  @override
  Future<CreateEventUsecaseOutput> createActivity(
      CreateEventUsecaseInput input) async {
    return _activityRemoteDataSource.createEvent(input);
  }

  /// [SaveEventInHiveUsecaseInput] is received to [cacheCreateEvent] method as parameter
  /// [CacheCreateEventUsecaseOutput] is returned from [cacheCreateEvent] method
  @override
  Future<CacheCreateEventUsecaseOutput> cacheCreateEvent(
      CacheCreateEventUsecaseInput input) async {
    return _activityLocalDataSource.cacheCreateEvent(input);
  }

  /// [GetEventsCachedUsecaseInput] is received to [getCachedEvents] method as parameter
  /// [GetEventsCachedUsecaseOutput] is returned from [getCachedEvents] method
  @override
  Future<GetEventsCachedUsecaseOutput> getCachedEvents(
      GetEventsCachedUsecaseInput input) async {
    return _activityLocalDataSource.getEventsFromHive(input);
  }

  /// [GetEventsUsecaseInput] is received to [getEvents] method as parameter
  /// [GetEventsUsecaseOutput] is returned from [getEvents] method
  @override
  GetEventsUsecaseOutput getEvents(GetEventsUsecaseInput input) {
    return _activityRemoteDataSource.getEvents(input);
  }

  /// [UpdateActivityUsecaseInput] is received to [updateActivity] method as parameter
  /// [UpdateActivityUsecaseOutput] is returned from [updateActivity] method
  @override
  Future<UpdateActivityUsecaseOutput> updateActivity(
      UpdateActivityUsecaseInput input) async {
    return _activityRemoteDataSource.updateActivity(input);
  }

  /// [UpdateEventUsecaseInput] is received to [updateEvent] method as parameter
  /// [UpdateEventUsecaseOutput] is returned from [updateEvent] method
  @override
  Future<UpdateEventUsecaseOutput> updateEvent(
      UpdateEventUsecaseInput input) async {
    return _activityRemoteDataSource.updateEvent(input);
  }


  /// [UpdateCachedEventUsecaseInput] is received to [updateCachedEvent] method as parameter
  /// [UpdateCachedEventUsecaseOutput] is returned from [updateCachedEvent] method
  @override
  Future<UpdateCachedEventUsecaseOutput> updateCachedEvent(UpdateCachedEventUsecaseInput input) async {
    return _activityLocalDataSource.updateCachedEvent(input);
  }

////********** END METHODS **********////
}
