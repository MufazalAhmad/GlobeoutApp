import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/activity.dart';
import 'package:globout/features/activity/presentation/providers/activities_provider.dart';
import 'package:globout/features/activity/presentation/providers/home_activity_form_dragger_is_open_provider.dart';
import 'package:globout/features/home/presentation/providers/current_user_event_provider.dart';

class _AllActivitiesNotifier extends StateNotifier<List<ActivityModel>> {
  _AllActivitiesNotifier(super.state);

  void select(ActivityModel activity) {
    state = state
        .map((e) => e.isSelected ? e.copyWith(isSelected: false) : e)
        .toList();
    state = state
        .map((oldActivity) => activity.title == oldActivity.title
            ? activity.copyWith(isSelected: !activity.isSelected)
            : oldActivity)
        .toList();
  }

  void initialState() {
    state = state.map((e) => e.copyWith(isSelected: false)).toList();
  }
}

final allActivitiesCreateActivityProvider =
    StateNotifierProvider<_AllActivitiesNotifier, List<ActivityModel>>(
  (ref) {
    final activities = ref.watch(activitiesProvider);
    ref.listen(homeActivityFormDraggerIsOpenProvider, (previous, isClosed) {
      final alreadyEvent = ref.read(currentUserEventProvider);
      if (isClosed && alreadyEvent == null) {
        ref.invalidateSelf();
      }
    });
    return _AllActivitiesNotifier(activities);
  },
);
