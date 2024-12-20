////********** START IMPORTS **********////
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:globout/features/activity/data/entities/event/event_firebase/event_firebase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../../../../helpers/network_call_helper/network_call_helper.dart';
import '../../../../../util/exceptions/exceptions.dart';
import 'activity_remote_datasource.dart';
import '../../../domain/usecases/update_activity_location.dart';
import '../../../domain/usecases/create_activity.dart';
import '../../../domain/usecases/get_events.dart';
import '../../../domain/usecases/update_activity.dart';
import '../../../domain/usecases/update_event.dart';
////********** END IMPORTS **********////

const String _ACTIVITIES = "activities";

@LazySingleton(as: ActivityRemoteDataSource)
class ActivityRemoteDataSourceImp implements ActivityRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  final fireStore = FirebaseFirestore.instance;

  CollectionReference<Map<String, Object?>> get activities =>
      FirebaseFirestore.instance.collection(_ACTIVITIES);

  ActivityRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

////********** START METHODS **********////

  /// [UpdateActivityLocationUsecaseInput] is received to [updateActivityLocation] method as parameter
  /// [UpdateActivityLocationUsecaseOutput] is returned from [updateActivityLocation] method
  @override
  Future<UpdateActivityLocationUsecaseOutput> updateActivityLocation(
      UpdateActivityLocationUsecaseInput input) async {
    final lat = input.lat + 0.005;
    final lng = input.lng + 0.005;

    try {
      final data = {
        "lat": lat,
        "lng": lng,
        "updatedTime": DateTime.now().toIso8601String(),
      };

      await activities.doc(input.activityId).update(data);
      return UpdateActivityLocationUsecaseOutput();
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

  /// [CreateEventUsecaseInput] is received to [createEvent] method as parameter
  /// [CreateEventUsecaseOutput] is returned from [createEvent] method
  @override
  Future<CreateEventUsecaseOutput> createEvent(
      CreateEventUsecaseInput input) async {
    try {
      bool pending = true;
      if (input.inMinutes == 0) {
        pending = false;
      }
      final eventId = DateTime.now().toIso8601String();

      final data = {
        "id": eventId,
        "expired": false,
        "pending": pending,
        "createdAt": DateTime.now().toIso8601String(),
        "userId": input.userId,
        "inMinutes": input.inMinutes,
        "forHours": input.forHours,
        "activities": input.activities,
        "forAllFriends": input.forAllFriends,
        "lat": input.lat,
        "lng": input.lng,
        "updatedTime": DateTime.now().toIso8601String(),
      };
      await activities.doc(eventId).set(data);

      return CreateEventUsecaseOutput(id: eventId);
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

  /// [GetEventsUsecaseInput] is received to [getEvents] method as parameter
  /// [GetEventsUsecaseOutput] is returned from [getEvents] method
  @override
  GetEventsUsecaseOutput getEvents(GetEventsUsecaseInput input) {
    try {
      final events = activities
          .where('expired', isEqualTo: false)
          .where('pending', isEqualTo: false)
          .orderBy("updatedTime", descending: true)
          .snapshots();

      final eventsWithUsers = events.asyncMap(
        (event) async {
          final data = <Map<String, dynamic>>[];

          for (final eventDoc in event.docs) {
            final eventData = eventDoc.data();
            final userId = eventData['userId'] as String;
            final userDoc = await FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .get();

            _checkIfExpire(eventData, eventDoc.id);

            final userData = userDoc.data();

            final eventWithUserData = {
              ...eventData,
              'user': userData!,
            };

            data.add(eventWithUserData);
          }

          return data;
        },
      );

      final eventEntities = eventsWithUsers.map(
        (event) => event
            .map(
              (e) => FirebaseEventEntity.fromJson(e),
            )
            .toList(),
      );

      return GetEventsUsecaseOutput(events: eventEntities);
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

  Future<void> _checkIfExpire(Map<String, dynamic> doc, id) async {
    try {
      final createdAt = DateTime.parse(doc['createdAt']).add(Duration(
        minutes: doc['inMinutes'],
      ));
      final createdForTime = doc['forHours'];

      bool isExpired =
          DateTime.now().difference(createdAt).inMinutes > createdForTime;

      if (isExpired) {
        await FirebaseFirestore.instance
            .collection('activities')
            .doc(id)
            .update({
          'expired': true,
        });
      }
    } catch (e) {
      //
    }
  }

  /// [UpdateActivityUsecaseInput] is received to [updateActivity] method as parameter
  /// [UpdateActivityUsecaseOutput] is returned from [updateActivity] method
  @override
  Future<UpdateActivityUsecaseOutput> updateActivity(
      UpdateActivityUsecaseInput input) async {
    await FirebaseFirestore.instance
        .collection('activities')
        .doc(input.id)
        .update({"updatedTime": DateTime.now().toString()});
    return UpdateActivityUsecaseOutput();
  }

  /// [UpdateEventUsecaseInput] is received to [updateEvent] method as parameter
  /// [UpdateEventUsecaseOutput] is returned from [updateEvent] method
  @override
  Future<UpdateEventUsecaseOutput> updateEvent(
      UpdateEventUsecaseInput input) async {
    try {
      final data = {
        "id": input.eventId,
        "expired": false,
        "userId": input.userId,
        "inMinutes": input.inMinutes,
        "forHours": input.forHours,
        "activities": input.activities,
        "forAllFriends": input.forAllFriends,
        "lat": input.lat,
        "lng": input.lng,
        "updatedTime": DateTime.now().toIso8601String(),
      };
      await activities.doc(input.eventId).update(data);

      return UpdateEventUsecaseOutput();
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

////********** END METHODS **********////
}
