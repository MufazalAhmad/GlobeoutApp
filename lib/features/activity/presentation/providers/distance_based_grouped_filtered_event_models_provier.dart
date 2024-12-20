import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/presentation/providers/filtered_event_models_provider.dart';
import 'package:globout/features/home/presentation/providers/calculate_distance_provider_without_units.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final distanceBasedGroupedFilteredEventModelsProvider =
    Provider<List<List<EventModel>>>(
  (ref) {
    final events = ref.watch(filteredEventModelsProvider);

    final list = <List<EventModel>>[];

    for (var i = 0; i < events.length; i++) {
      if (list.any(
          (element) => element.any((element) => element.id == events[i].id))) {
        continue;
      }

      /// [Creating Sublist for I]
      final localListForI = [events[i]];

      /// [Matching the I event with rest of elements in the list]
      for (var j = i + 1; j < events.length; j++) {
        /// [Calculate distance between element at [i] and element at [j].
        final locationOfEventAtI = LatLng(events[i].lat, events[i].lng);
        final locationOfEventAtJ = LatLng(events[j].lat, events[j].lng);

        final distance = ref.read(
          calculateDistanceProviderWithoutUnits(
            (locationOfEventAtI, locationOfEventAtJ),
          ),
        );

        if (distance < 3700) {
          localListForI.add(events[j]);
        }
      }

      list.add(localListForI);
    }

    return list;
  },
);
