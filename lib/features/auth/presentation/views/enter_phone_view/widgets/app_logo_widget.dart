import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 109.73.w,
      height: 114.36.h,
      child: Image.asset(R.pngs.LOGO),
    );
  }
}
