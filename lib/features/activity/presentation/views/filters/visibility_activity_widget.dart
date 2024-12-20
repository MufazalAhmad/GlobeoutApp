import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/widgets/small_switch_button.dart';
import 'package:globout/features/activity/presentation/providers/home_activity_form_dragger_is_open_provider.dart';
import 'package:globout/features/activity/presentation/providers/my_events_visibility_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/home/presentation/providers/event_models_provider.dart';
import 'package:globout/util/resource/r.dart';
import '../../../../auth/presentation/providers/switch_user_visibility_provider.dart';

class VisibilityActivityWidget extends ConsumerWidget {
  const VisibilityActivityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldBeVisible = !ref.watch(homeActivityFormDraggerIsOpenProvider);
    final isVisible = ref.watch(myEventsVisibilityProvider);
    final user = ref.watch(userProvider);
    final activities = ref.watch(eventModelsProvider);
    final hasAnyActivity =
        activities.any((element) => element.userId == user!.id);

    /// [Switch Button Function]
    void switchChanged(value) {
      final userId = ref.read(userProvider.notifier).user!.id;
      final event = ref
          .read(eventModelsProvider.notifier)
          .getList
          .firstWhere((element) => element.userId == userId);

      ref.read(myEventsVisibilityProvider.notifier).toggle(event);
      ref.read(switchUserVisibilityProvider.future);
    }

    return AnimatedPositioned(
      top: 120.h,
      right: (shouldBeVisible && hasAnyActivity) ? -20.w : -120.w,
      duration: const Duration(milliseconds: 250),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: R.colors.blue_FF4F7CB9.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: [
            SmallSwitchButton(
              value: isVisible,
              onChanged: switchChanged,
            ),
            SizedBox(width: 5.w),
            Text(
              "Visibility",
              style: TextStyle(
                color: R.colors.pink_FFCF6BBC,
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}
