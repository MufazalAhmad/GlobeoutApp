import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/presentation/providers/distance_based_grouped_filtered_event_models_provier.dart';
import 'package:globout/features/activity/presentation/providers/filtered_event_models_provider.dart';
import 'package:globout/features/location/domain/models/custom_marker_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final markersProvider = Provider<List<CustomMarkerModel>>((ref) {
  final events = ref.watch(distanceBasedGroupedFilteredEventModelsProvider);

  return events
      // .where((element) => element.markerImage != null)
      .map(
        (e) => CustomMarkerModel(
            marker: Marker(
              markerId: MarkerId(e.first.id),
              position: LatLng(e.first.lat, e.first.lng),
              icon: BitmapDescriptor.fromBytes(e.first.markerImage!),
            ),
            event: e),
      )
      .toList();
});
