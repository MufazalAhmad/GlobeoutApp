import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final calculateDistanceProviderWithoutUnits =
    Provider.autoDispose.family<double, (LatLng, LatLng)>((ref, locations) {
  final fromLocation = locations.$1;
  final toLocation = locations.$2;

  final distanceInMeters = Geolocator.distanceBetween(
    fromLocation.latitude,
    fromLocation.longitude,
    toLocation.latitude,
    toLocation.longitude,
  );

  return distanceInMeters;
});
