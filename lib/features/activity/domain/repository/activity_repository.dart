////********** START IMPORTS **********////
import '../../../../infrastructure/repository.dart';
import '../usecases/update_activity_location.dart';
import '../usecases/create_activity.dart';
import '../usecases/cache_create_event.dart';
import '../usecases/get_cached_events.dart';
import '../usecases/get_events.dart';
import '../usecases/update_activity.dart';
import '../usecases/update_event.dart';
import '../usecases/update_cached_event.dart';
////********** END IMPORTS **********////

abstract class ActivityRepository extends Repository {
////********** START METHODS **********////

  /// [UpdateActivityLocationUsecaseInput] is received to [updateActivityLocation] method as parameter
  /// [UpdateActivityLocationUsecaseOutput] is returned from [updateActivityLocation] method
  Future<UpdateActivityLocationUsecaseOutput> updateActivityLocation(
      UpdateActivityLocationUsecaseInput input);

  /// [CreateEventUsecaseInput] is received to [createActivity] method as parameter
  /// [CreateEventUsecaseOutput] is returned from [createActivity] method
  Future<CreateEventUsecaseOutput> createActivity(
      CreateEventUsecaseInput input);

  /// [SaveEventInHiveUsecaseInput] is received to [cacheCreateEvent] method as parameter
  /// [CacheCreateEventUsecaseOutput] is returned from [cacheCreateEvent] method
  Future<CacheCreateEventUsecaseOutput> cacheCreateEvent(
      CacheCreateEventUsecaseInput input);

  /// [GetEventsCachedUsecaseInput] is received to [getCachedEvents] method as parameter
  /// [GetEventsCachedUsecaseOutput] is returned from [getCachedEvents] method
  Future<GetEventsCachedUsecaseOutput> getCachedEvents(
      GetEventsCachedUsecaseInput input);

  /// [GetEventsUsecaseInput] is received to [getEvents] method as parameter
  /// [GetEventsUsecaseOutput] is returned from [getEvents] method
  GetEventsUsecaseOutput getEvents(GetEventsUsecaseInput input);


  /// [UpdateActivityUsecaseInput] is received to [updateActivity] method as parameter
  /// [UpdateActivityUsecaseOutput] is returned from [updateActivity] method
  Future<UpdateActivityUsecaseOutput> updateActivity(UpdateActivityUsecaseInput input);


  /// [UpdateEventUsecaseInput] is received to [updateEvent] method as parameter
  /// [UpdateEventUsecaseOutput] is returned from [updateEvent] method
  Future<UpdateEventUsecaseOutput> updateEvent(UpdateEventUsecaseInput input);


  /// [UpdateCachedEventUsecaseInput] is received to [updateCachedEvent] method as parameter
  /// [UpdateCachedEventUsecaseOutput] is returned from [updateCachedEvent] method
  Future<UpdateCachedEventUsecaseOutput> updateCachedEvent(UpdateCachedEventUsecaseInput input);

////********** END METHODS **********////
}
