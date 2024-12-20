////********** START IMPORTS **********////
import '../../../../../infrastructure/datasource.dart';
import '../../../domain/usecases/update_activity_location.dart';
import '../../../domain/usecases/create_activity.dart';
import '../../../domain/usecases/get_events.dart';
import '../../../domain/usecases/update_activity.dart';
import '../../../domain/usecases/update_event.dart';
////********** END IMPORTS **********////

abstract class ActivityRemoteDataSource extends DataSource {
  ////********** START METHODS **********////

  /// [UpdateActivityLocationUsecaseInput] is received to [updateActivityLocation] method as parameter
  /// [UpdateActivityLocationUsecaseOutput] is returned from [updateActivityLocation] method
  Future<UpdateActivityLocationUsecaseOutput> updateActivityLocation(
      UpdateActivityLocationUsecaseInput input);

  /// [CreateEventUsecaseInput] is received to [createEvent] method as parameter
  /// [CreateEventUsecaseOutput] is returned from [createEvent] method
  Future<CreateEventUsecaseOutput> createEvent(CreateEventUsecaseInput input);

  /// [GetEventsUsecaseInput] is received to [getEvents] method as parameter
  /// [GetEventsUsecaseOutput] is returned from [getEvents] method
  GetEventsUsecaseOutput getEvents(GetEventsUsecaseInput input);


  /// [UpdateActivityUsecaseInput] is received to [updateActivity] method as parameter
  /// [UpdateActivityUsecaseOutput] is returned from [updateActivity] method
  Future<UpdateActivityUsecaseOutput> updateActivity(UpdateActivityUsecaseInput input);


  /// [UpdateEventUsecaseInput] is received to [updateEvent] method as parameter
  /// [UpdateEventUsecaseOutput] is returned from [updateEvent] method
  Future<UpdateEventUsecaseOutput> updateEvent(UpdateEventUsecaseInput input);

////********** END METHODS **********////
}
