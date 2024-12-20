import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/activity.dart';
import 'package:globout/features/activity/domain/models/filter_model.dart';
import 'package:globout/features/activity/presentation/providers/activities_provider.dart';

class _SelectedActivitiesForFilterNotifier extends StateNotifier<FilterModel> {
  _SelectedActivitiesForFilterNotifier(super.state);

  void forAllFriends() {
    state = state.copyWith(allFriends: true);
  }

  void forCloseFriends() {
    state = state.copyWith(allFriends: false);
  }

  void select(ActivityModel model) {
    state = state.copyWith(
      activities: state.activities
          .map((e) => e.title.toLowerCase() == model.title.toLowerCase()
              ? e.copyWith(isSelected: !e.isSelected)
              : e)
          .toList(),
    );
  }

  @visibleForTesting
  void setFilter(FilterModel model) {
    state = model;
  }
}

final selectedActivitiesForFilterProvider =
    StateNotifierProvider<_SelectedActivitiesForFilterNotifier, FilterModel>(
  (ref) {
    final activities = ref.watch(activitiesProvider);
    final filter = FilterModel(
      activities: activities.map((e) => e.copyWith(isSelected: true)).toList(),
      allFriends: true,
    );
    return _SelectedActivitiesForFilterNotifier(filter);
  },
);
