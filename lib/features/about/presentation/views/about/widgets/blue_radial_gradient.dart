import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class BlueRadialGradientWidget extends StatelessWidget {
  const BlueRadialGradientWidget({
    super.key,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 378.w,
        height: 389.h,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.5,
            focalRadius: 0.2,
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
