import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/activity.dart';
import 'package:globout/features/activity/presentation/providers/all_activities_create_activity_provider.dart';

final selectedActivitiesForCreateActivityProvider =
    Provider<List<ActivityModel>>(
  (ref) {
    final activities = ref.watch(allActivitiesCreateActivityProvider);

    return activities.where((element) => element.isSelected).toList();
  },
);
