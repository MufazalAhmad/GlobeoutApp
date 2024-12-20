import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class ProfileInputFieldWidget extends StatelessWidget {
  const ProfileInputFieldWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.textInputType,
    required this.controller,
  });

  final String hintText;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: Consumer(builder: (context, ref, _) {
        return TextFormField(
          onChanged: onChanged,
          controller: controller,
          keyboardType: textInputType ?? TextInputType.text,
          style: TextStyle(color: R.colors.white_FFF5F5F5),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: R.colors.grey_FF868685,
              fontWeight: FontWeight.w300,
              fontSize: 12.sp,
            ),
            contentPadding: EdgeInsets.all(20.r),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: R.colors.grey_FFE8E8E8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: R.colors.grey_FFE8E8E8,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: R.colors.grey_FFE8E8E8,
              ),
            ),
          ),
        );
      }),
    );
  }
}
