import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class PurpleGradientWidget extends StatelessWidget {
  const PurpleGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 330.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            R.colors.orchid_FFDE6CBA.withOpacity(0.2),
            R.colors.jetBlack_FF2E2E2E,
          ],
        ),
      ),
    );
  }
}
