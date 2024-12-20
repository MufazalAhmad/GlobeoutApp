import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/event.dart';

class _SelectedClusterNotifier extends StateNotifier<List<EventModel>> {
  _SelectedClusterNotifier() : super(<EventModel>[]);

  void setCluster(List<EventModel> cluster) {
    state = cluster;
  }

  void remove() {
    state = [];
  }
}

final selectedClusterProvider =
    StateNotifierProvider<_SelectedClusterNotifier, List<EventModel>>(
  (ref) => _SelectedClusterNotifier(),
);
