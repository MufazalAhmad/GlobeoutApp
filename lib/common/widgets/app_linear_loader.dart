import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class AppLinearLoader extends StatelessWidget {
  const AppLinearLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: LinearProgressIndicator(
          color: R.colors.cyan_FF00C2B7,
          backgroundColor: R.colors.white_FFF5F5F5.withOpacity(0.7),
        ),
      ),
    );
  }
}
