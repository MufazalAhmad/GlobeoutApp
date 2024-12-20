import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class AddFriendsViewBg extends StatelessWidget {
  const AddFriendsViewBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      color: R.colors.jetBlack_FF2E2E2E,
      child: Stack(
        children: [
          Positioned(
            right: 179.w,
            bottom: 558.h,
            child: Container(
              width: 328.r,
              height: 328.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(328.r),
                gradient: RadialGradient(
                  colors: [
                    R.colors.orchid_FFDE6CBA.withOpacity(0.5),
                    R.colors.jetBlack_FF2E2E2E,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 117.w,
            bottom: 223.h,
            child: Container(
              width: 328.r,
              height: 328.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(328.r),
                gradient: RadialGradient(
                  colors: [
                    R.colors.orchid_FFDE6CBA.withOpacity(0.5),
                    R.colors.jetBlack_FF2E2E2E,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
