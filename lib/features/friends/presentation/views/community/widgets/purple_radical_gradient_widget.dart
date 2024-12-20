import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class PurpleRadialGradientWidget extends StatelessWidget {
  const PurpleRadialGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80.h,
      left: -142.w,
      child: Container(
        width: 328.w,
        height: 330.h,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.5,
            focalRadius: 0.2,
            colors: [
              R.colors.orchid_FFDE6CBA,
              R.colors.orchid_FFDE6CBA.withOpacity(0.000001),
            ],
          ),
        ),
      ),
    );
  }
}
