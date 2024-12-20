import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/util/resource/r.dart';

class BottomSheetPickerButton<T> extends StatelessWidget {
  const BottomSheetPickerButton({
    super.key,
    this.sheetTitle,
    this.onChanged,
    this.options,
    required this.showTitle,
    required this.selected,
    this.buttonTitle = const SizedBox.shrink(),
  });

  final Widget buttonTitle;
  final Widget? sheetTitle;
  final List<T>? options;
  final void Function(T)? onChanged;
  final String Function(T) showTitle;
  final bool Function(T) selected;

  void select(T value) {
    if (onChanged != null) {
      onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
          ),
          builder: (context) {
            /// [Bottom Sheet With Options]
            return TapRegion(
              groupId: 1,
              child: Container(
                padding: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
                width: 1.sw,
                height: 298.h,
                child: Column(
                  children: [
                    sheetTitle ?? const SizedBox.shrink(),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.only(top: 10.h),
                        children: [
                          for (final option in options ?? <T>[])
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    select(option);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                      horizontal: 15.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selected(option)
                                          ? R.colors.cyan_FF00C2B7
                                          : R.colors.transparent_FF000000,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          showTitle(option),
                                          style: TextStyle(
                                            color: R.colors.jetBlack_FF2E2E2E,
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Icon(selected(option)
                                            ? Icons.radio_button_checked_sharp
                                            : Icons.radio_button_off_rounded),
                                      ],
                                    ),
                                  ),
                                ),
                                11.82.hb,
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },

      /// [Button]
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.41.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: R.colors.cyan_FF00C2B7,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: [
            buttonTitle,
            4.09.hb,
            Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}
