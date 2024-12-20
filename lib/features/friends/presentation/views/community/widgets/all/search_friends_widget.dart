import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globout/util/resource/r.dart';

class SearchFriendsWidget extends StatelessWidget {
  SearchFriendsWidget({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 314.w,
      height: 34.h,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: R.colors.white_FFF5F5F5,
          fontWeight: FontWeight.w300,
          fontSize: 12.sp,
        ),
        decoration: InputDecoration(
          fillColor: R.colors.jetBlack_FF2E2E2E,
          filled: true,
          hintText: "Search your friends",
          hintStyle: TextStyle(
            color: R.colors.white_FFF5F5F5.withOpacity(0.5),
            fontWeight: FontWeight.w300,
            fontSize: 12.sp,
          ),
          contentPadding: EdgeInsets.all(4.r),
          prefixIcon: Padding(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(R.svgs.SEARCH),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
              color: R.colors.grey_FF868685,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
              color: R.colors.grey_FF868685,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
              color: R.colors.grey_FF868685,
            ),
          ),
        ),
      ),
    );
  }
}
