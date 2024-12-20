import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/presentation/providers/distance_based_grouped_filtered_event_models_provier.dart';
import 'package:globout/features/home/presentation/views/home_view/widgets/custom_map_marker_widget.dart';

class CustomMapMarkerClusterWidget extends ConsumerStatefulWidget {
  const CustomMapMarkerClusterWidget({super.key});

  @override
  ConsumerState<CustomMapMarkerClusterWidget> createState() =>
      _CustomMapMarkerClusterWidgetState();
}

class _CustomMapMarkerClusterWidgetState
    extends ConsumerState<CustomMapMarkerClusterWidget> {
  @override
  Widget build(BuildContext context) {
    final clustersOfEvents =
        ref.watch(distanceBasedGroupedFilteredEventModelsProvider);
    return Stack(
      children: [
        for (final cluster in clustersOfEvents)
          cluster.length > 1
              ? ClusterMapMarkerWidget(events: cluster)
              : CustomMapMarkerWidget(event: cluster.first),
      ],
    );
  }
}
