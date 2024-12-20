import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class BgBlueGradientWidget extends StatelessWidget {
  const BgBlueGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            R.colors.charcoal_FF1A1A1A,
            R.colors.cyan_FF00C2B7,
            R.colors.charcoal_FF1A1A1A,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
