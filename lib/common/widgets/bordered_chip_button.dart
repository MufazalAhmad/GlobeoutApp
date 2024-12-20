import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/resource/r.dart';

class BorderedChipButton extends StatelessWidget {
  const BorderedChipButton({
    super.key,
    required this.title,
    this.selected = false,
    this.onTap,
    this.color,
  });

  final String title;
  final Color? color;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 8.1.w,
              vertical: 2.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 21.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: selected ? color : null,
              border: Border.all(
                color: color ?? R.colors.lavenderBlue_FF966EC3,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selected)
                  Container(
                    margin: EdgeInsets.only(right: 4.w),
                    child: Icon(
                      Icons.check,
                      color: R.colors.white_FFF5F5F5,
                      size: 12.sp,
                    ),
                  ),
                Text(
                  title,
                  style: TextStyle(
                    color: selected
                        ? R.colors.white_FFF5F5F5
                        : (color ?? R.colors.lavenderBlue_FF966EC3),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
