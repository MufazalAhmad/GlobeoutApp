import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/util/resource/r.dart';

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.onTap,
  });

  final String svgIcon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          /// [Icon]
          SizedBox(
            height: 30.r,
            width: 30.r,
            child: SvgPicture.asset(svgIcon),
          ),

          36.wb,

          /// [Title]
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              color: R.colors.white_FFF5F5F5,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
