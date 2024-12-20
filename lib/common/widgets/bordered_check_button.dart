import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/util/resource/r.dart';

class BorderedCheckButton extends StatelessWidget {
  const BorderedCheckButton({
    super.key,
    required this.title,
    this.isChecked = false,
    this.fontSize,
    this.onChanged,
  });

  final String title;
  final double? fontSize;
  final bool isChecked;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged!(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        decoration: BoxDecoration(
          color:
              isChecked ? R.colors.cyan_FF00C2B7 : R.colors.charcoal_FF1A1A1A,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(color: R.colors.cyan_FF00C2B7),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// [Check Box]
            Container(
              width: 15.r,
              height: 15.r,
              decoration: BoxDecoration(
                color: R.colors.charcoal_FF1A1A1A,
                border: Border.all(color: R.colors.cyan_FF00C2B7),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      size: 12.r,
                      color: R.colors.cyan_FF00C2B7,
                    )
                  : const SizedBox.shrink(),
            ),

            4.9.wb,

            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                color: isChecked
                    ? R.colors.charcoal_FF1A1A1A
                    : R.colors.white_FFF5F5F5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
