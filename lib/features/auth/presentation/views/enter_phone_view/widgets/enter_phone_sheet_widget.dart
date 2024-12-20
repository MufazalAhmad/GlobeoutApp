import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/radius_button.dart';
import 'package:globout/features/auth/presentation/providers/login_provider.dart';
import 'package:globout/features/auth/presentation/views/enter_phone_view/widgets/number_picker_widget.dart';
import 'package:globout/util/exceptions/exceptions.dart';
import 'package:globout/util/resource/r.dart';

class EnterPhoneSheetWidget extends ConsumerWidget {
  const EnterPhoneSheetWidget({super.key});

  Future<void> sendOtp(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(loginProvider.future);
    } on PhoneNumberFormatException {
      showError(context, "Invalid Phone Number");
    } on UserNotFoundException {
      showError(context, "User not found");
    } catch (e) {
      showError(context, "Something went wrong");
    }
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          "Let's start!",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        10.hb,
        Text(
          "Please enter and confirm your phone number",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        52.hb,

        /// [Number Picker]
        const NumberPickerWidget(),

        63.hb,

        /// [Next Button]
        RadiusButton(
          width: 178.w,
          height: 50.h,
          color: R.colors.lavenderBlue_FF966EC3,
          text: "Next",
          loadingEnabled: true,
          onPressed: () => sendOtp(context, ref),
          fontSize: 18.sp,
        ),
      ],
    );
  }
}
