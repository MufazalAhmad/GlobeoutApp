import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

class PermissionAccessDialog extends StatelessWidget {
  const PermissionAccessDialog({
    super.key,
    required this.onReq,
    required this.title,
  });

  final String title;
  final VoidCallback onReq;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 18.h),
            decoration: BoxDecoration(
              color: R.colors.white_FFF5F5F5,
              borderRadius: BorderRadius.circular(30.r),
            ),
            width: 343.w,
            child: Column(
              children: [
                15.hb,
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                14.hb,
                GestureDetector(
                  onTap: onReq,
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: R.colors.jetBlack_FF2E2E2E,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          67.hb,
        ],
      ),
    );
  }
}
