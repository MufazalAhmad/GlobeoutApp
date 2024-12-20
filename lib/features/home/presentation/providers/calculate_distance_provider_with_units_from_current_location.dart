import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:globout/features/home/presentation/providers/location_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final calculateDistanceProviderWithUnitsFromCurrentLocation =
    Provider.autoDispose.family<String, LatLng>((ref, anotherLocation) {
  final locationSync = ref.watch(locationProvider);

  if (locationSync.asData == null) {
    return "0 m";
  }

  final location = locationSync.asData!.value;

  final distanceInMeters = Geolocator.distanceBetween(location.lat,
      location.lng, anotherLocation.latitude, anotherLocation.longitude);

  if (distanceInMeters < 1000) {
    return "${(distanceInMeters).toStringAsFixed(1)} m";
  }

  return "${(distanceInMeters / 1000).toStringAsFixed(1)} km";
});
