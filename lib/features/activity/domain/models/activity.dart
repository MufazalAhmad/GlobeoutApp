import 'dart:ui';

class ActivityModel {
  final String title;
  final Color color;
  final bool isSelected;
  final String icon;

  ActivityModel({
    required this.title,
    required this.color,
    this.isSelected = false,
    required this.icon,
  });

  ActivityModel copyWith({bool? isSelected}) {
    return ActivityModel(
      title: title,
      color: color,
      isSelected: isSelected ?? this.isSelected,
      icon: icon,
    );
  }
}
