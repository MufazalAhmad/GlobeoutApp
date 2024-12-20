import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/activity.dart';
import 'package:globout/util/resource/r.dart';

final activitiesProvider = Provider<List<ActivityModel>>((ref) {
  final coffee = ActivityModel(
    title: 'Coffee',
    color: R.colors.blueishCyan_FF49A3C6,
    icon: R.activityIcons.COFFEE_ICON,
  );

  final nature = ActivityModel(
    title: 'Nature',
    color: R.colors.darkOrange_FFE95428,
    icon: R.activityIcons.NATURE_ICON,
  );

  final party = ActivityModel(
    title: 'Party',
    color: R.colors.green_FF4DAB74,
    icon: R.activityIcons.PARTY_ICON,
  );

  final travel = ActivityModel(
    title: 'Travel',
    color: R.colors.orange_FFFF9A00,
    icon: R.activityIcons.TRAVEL_ICON,
  );

  final drink = ActivityModel(
    title: 'Drink',
    color: R.colors.pink_FFCF6BBC,
    icon: R.activityIcons.DRINK_ICON,
  );

  final study = ActivityModel(
    title: 'Study',
    color: R.colors.blue_FF4F7CB9,
    icon: R.activityIcons.STUDY_ICON,
  );

  final sport = ActivityModel(
    title: 'Sport',
    color: R.colors.purple_FF966EC3,
    icon: R.activityIcons.SPORTS_ICON,
  );

  final art = ActivityModel(
    title: 'Art',
    color: R.colors.red_FFFF0D46,
    icon: R.activityIcons.ART_ICON,
  );

  final eat = ActivityModel(
    title: 'Eat',
    color: R.colors.cyan_FF00C2B7,
    icon: R.activityIcons.EAT_ICON,
  );

  return [coffee, nature, party, travel, drink, study, sport, art, eat];
});
