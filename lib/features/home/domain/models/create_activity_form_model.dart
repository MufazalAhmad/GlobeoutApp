import 'package:globout/features/activity/domain/models/activity.dart';

class CreateActivityFormModel {
  final List<ActivityModel>? activities;
  final int? inHowManyMinutes;
  final int? forHowManyHours;
  final bool? forAllFriends;

  CreateActivityFormModel({
    this.activities,
    this.forAllFriends,
    this.forHowManyHours,
    this.inHowManyMinutes,
  });

  CreateActivityFormModel copyWith({
    List<ActivityModel>? activities,
    int? inHowManyMinutes,
    int? forHowManyHours,
    bool? forAllFriends,
  }) {
    return CreateActivityFormModel(
      activities: activities ?? this.activities,
      inHowManyMinutes: inHowManyMinutes ?? this.inHowManyMinutes,
      forHowManyHours: forHowManyHours ?? this.forHowManyHours,
      forAllFriends: forAllFriends ?? this.forAllFriends,
    );
  }
}
