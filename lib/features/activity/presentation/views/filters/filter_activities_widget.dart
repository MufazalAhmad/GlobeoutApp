import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

import '../../providers/filter_sheet_open_provider.dart';
import '../../providers/home_activity_form_dragger_is_open_provider.dart';

class FilterActivitiesWidget extends ConsumerWidget {
  const FilterActivitiesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldBeVisible = !ref.watch(homeActivityFormDraggerIsOpenProvider);
    return AnimatedPositioned(
      top: 120.h,
      left: shouldBeVisible ? -20.w : -120.w,
      duration: const Duration(milliseconds: 250),
      child: InkWell(
        onTap: () {
          ref.read(filterSheetOpenProvider.notifier).open();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: R.colors.blue_FF4F7CB9.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.filter_list_alt,
                color: R.colors.pink_FFCF6BBC,
              ),
              Text(
                "Filter",
                style: TextStyle(
                  color: R.colors.pink_FFCF6BBC,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
