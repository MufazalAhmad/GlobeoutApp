import 'package:globout/features/activity/domain/models/event.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkerModel {
  final Marker marker;
  final List<EventModel> event;

  CustomMarkerModel({
    required this.marker,
    required this.event,
  });
}
