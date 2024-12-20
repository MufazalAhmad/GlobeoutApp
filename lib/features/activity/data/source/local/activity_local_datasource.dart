////********** START IMPORTS **********////
import '../../../../../infrastructure/datasource.dart';
import '../../../domain/usecases/cache_create_event.dart';
import '../../../domain/usecases/get_cached_events.dart';
import '../../../domain/usecases/update_cached_event.dart';
////********** END IMPORTS **********////

abstract class ActivityLocalDataSource extends DataSource {
  ////********** START METHODS **********////
  /// [SaveEventInHiveUsecaseInput] is received to [cacheCreateEvent] method as parameter
  /// [CacheCreateEventUsecaseOutput] is returned from [cacheCreateEvent] method
  Future<CacheCreateEventUsecaseOutput> cacheCreateEvent(
      CacheCreateEventUsecaseInput input);

  /// [GetEventsCachedUsecaseInput] is received to [getEventsFromHive] method as parameter
  /// [GetEventsCachedUsecaseOutput] is returned from [getEventsFromHive] method
  Future<GetEventsCachedUsecaseOutput> getEventsFromHive(
      GetEventsCachedUsecaseInput input);


  /// [UpdateCachedEventUsecaseInput] is received to [updateCachedEvent] method as parameter
  /// [UpdateCachedEventUsecaseOutput] is returned from [updateCachedEvent] method
  Future<UpdateCachedEventUsecaseOutput> updateCachedEvent(UpdateCachedEventUsecaseInput input);

////********** END METHODS **********////
}
