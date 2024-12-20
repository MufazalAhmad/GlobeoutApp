import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/activity.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/presentation/providers/selected_activities_for_filter_provider.dart';

final matchedActivityProvider = Provider.family<ActivityModel, EventModel>(
  (ref, event) {
    final filter = ref.watch(selectedActivitiesForFilterProvider);
    final selectedActivities =
        filter.activities.where((e) => e.isSelected).toList();

    return selectedActivities.firstWhere(
      (element) => event.activities.any(
        (eventActivity) =>
            eventActivity.toLowerCase() == element.title.toLowerCase(),
      ),
    );
  },
);
