import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class BlueRadialGradientWidget extends StatelessWidget {
  const BlueRadialGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110.h,
      child: Container(
        width: 364.w,
        height: 376.h,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.5,
            focalRadius: 0.1,
            colors: [
              R.colors.cyan_FF00C2B7,
              R.colors.cyan_FF00C2B7.withOpacity(0.000001),
            ],
          ),
        ),
      ),
    );
  }
}
