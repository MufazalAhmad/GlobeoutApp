import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class SmallSwitchButton extends StatelessWidget {
  const SmallSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 25.06.w,
        height: 15.87.h,
        decoration: BoxDecoration(
          color: R.colors.pink_FFCF6BBC,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              left: value ? 14.w : 4.w,
              top: 0,
              bottom: 0,
              child: Center(
                child: AnimatedContainer(
                  width: 7.11.r,
                  height: 7.11.r,
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    color: value
                        ? R.colors.jetBlack_FF2E2E2E
                        : R.colors.jetBlack_FF2E2E2E.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
