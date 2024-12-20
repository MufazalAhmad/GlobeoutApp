import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/bordered_check_button.dart';
import 'package:globout/common/widgets/bordered_chip_button.dart';
import 'package:globout/features/activity/presentation/providers/filter_sheet_open_provider.dart';
import 'package:globout/features/activity/presentation/providers/selected_activities_for_filter_provider.dart';
import 'package:globout/util/resource/r.dart';

class ActivitiesFilterSheet extends ConsumerWidget {
  const ActivitiesFilterSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(selectedActivitiesForFilterProvider);
    final shouldOpen = ref.watch(filterSheetOpenProvider);

    return AnimatedPositioned(
      top: MediaQuery.of(context).padding.top,
      left: shouldOpen ? 0 : -390.w,
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: 390.w,
        height: 844.h,
        color: Colors.black.withOpacity(0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TapRegion(
              onTapOutside: (v) {
                ref.read(filterSheetOpenProvider.notifier).close();
              },
              child: SizedBox(
                width: 316.w,
                height: 310.h,
                child: Stack(
                  children: [
                    /// [Filters Sheet Right Side]
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          ref.read(filterSheetOpenProvider.notifier).close();
                        },
                        child: SvgPicture.asset(
                          R.svgs.FILTERS_SIDE,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    /// [Sheet Content]
                    Container(
                      width: 280.w,
                      height: 310.h,
                      color: R.colors.jetBlack_FF2E2E2E,
                      padding: EdgeInsets.only(top: 20.h),
                      child: Column(
                        children: [
                          /// [Title]
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Choose',
                                style: TextStyle(
                                  color: R.colors.cyan_FF00C2B7,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                ),
                              ),
                              Text(
                                ' Activities',
                                style: TextStyle(
                                  color: R.colors.white_FFF5F5F5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                ),
                              )
                            ],
                          ),

                          7.hb,

                          /// [Activities]
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: filter.activities
                                .map(
                                  (activity) => BorderedChipButton(
                                    title: activity.title,
                                    color: activity.color,
                                    selected: activity.isSelected,
                                    onTap: () {
                                      ref
                                          .read(
                                              selectedActivitiesForFilterProvider
                                                  .notifier)
                                          .select(activity);
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                          10.hb,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Choose',
                                style: TextStyle(
                                  color: R.colors.cyan_FF00C2B7,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                ),
                              ),
                              Text(
                                ' Group',
                                style: TextStyle(
                                  color: R.colors.white_FFF5F5F5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                ),
                              )
                            ],
                          ),
                          7.hb,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BorderedCheckButton(
                                title: "Close Friends",
                                fontSize: 12.sp,
                                isChecked: !filter.allFriends,
                                onChanged: (value) {
                                  ref
                                      .read(selectedActivitiesForFilterProvider
                                          .notifier)
                                      .forCloseFriends();
                                },
                              ),
                              BorderedCheckButton(
                                title: "All Friends",
                                fontSize: 12.sp,
                                isChecked: filter.allFriends,
                                onChanged: (value) {
                                  ref
                                      .read(selectedActivitiesForFilterProvider
                                          .notifier)
                                      .forAllFriends();
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
