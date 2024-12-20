import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class BgJetblackGradientWidget extends StatelessWidget {
  const BgJetblackGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            R.colors.jetBlack_FF2E2E2E,
            R.colors.charcoal_FF1A1A1A,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
