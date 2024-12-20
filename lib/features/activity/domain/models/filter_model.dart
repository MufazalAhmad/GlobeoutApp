import 'package:globout/features/activity/domain/models/activity.dart';

class FilterModel {
  final List<ActivityModel> activities;
  final bool allFriends;

  FilterModel({
    required this.activities,
    required this.allFriends,
  });

  FilterModel copyWith({bool? allFriends, List<ActivityModel>? activities}) {
    return FilterModel(
      activities: activities ?? this.activities,
      allFriends: allFriends ?? this.allFriends,
    );
  }
}
