import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/settings/presentation/providers/report_form_provider.dart';
import 'package:globout/util/resource/r.dart';

class ReportInputField extends StatelessWidget {
  const ReportInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return TextFormField(
          onChanged: (value) {
            ref.read(reportFormProvider.notifier).setDescription(value);
          },
          keyboardType: TextInputType.text,
          maxLines: 5,
          validator: (v) {
            if (v?.isEmpty ?? true) {
              return "Description is required";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Your report description",
            hintStyle: TextStyle(
              fontSize: 14.sp,
            ),
            filled: true,
            fillColor: R.colors.grey_FFE8E8E8,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: BorderSide(
                color: R.colors.grey_FFE8E8E8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: BorderSide(
                color: R.colors.grey_FFE8E8E8,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: BorderSide(
                color: R.colors.grey_FFE8E8E8,
              ),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          ),
        );
      },
    );
  }
}
