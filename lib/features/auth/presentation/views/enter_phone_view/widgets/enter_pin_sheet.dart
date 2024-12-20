import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/radius_button.dart';
import 'package:globout/features/auth/domain/models/auth_form_step/auth_form_step.dart';
import 'package:globout/features/auth/presentation/providers/auth_form_model_provider.dart';
import 'package:globout/features/auth/presentation/providers/auth_form_step_provider.dart';
import 'package:globout/features/auth/presentation/providers/selected_country_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/auth/presentation/providers/verify_otp_provider.dart';
import 'package:globout/features/auth/presentation/views/enter_phone_view/widgets/resend_otp_code_widget.dart';
import 'package:globout/util/exceptions/exceptions.dart';
import 'package:globout/util/resource/r.dart';
import 'package:globout/util/router/paths.dart';
import 'package:go_router/go_router.dart';

class EnterPinSheetWidget extends ConsumerStatefulWidget {
  const EnterPinSheetWidget({super.key});

  @override
  ConsumerState<EnterPinSheetWidget> createState() =>
      _EnterPinSheetWidgetState();
}

class _EnterPinSheetWidgetState extends ConsumerState<EnterPinSheetWidget> {
  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  final focusNodes = [
    for (var i = 0; i < 6; i++) FocusNode(),
  ];

  final controllers = [
    for (var i = 0; i < 6; i++) TextEditingController(),
  ];

  Future<void> verifyOtp(BuildContext context) async {
    try {
      final otp = controllers.map((e) => e.text).join();
      await ref.read(verifyOtpProvider(otp).future);
      final user = ref.read(userProvider.notifier).user;

      if (user!.name == null) {
        ref.read(authFormStepProvider.notifier).setStep(AuthFormStep.enterName);
      } else {
        if (mounted) {
          GoRouter.of(context).pushReplacement(RoutePaths.permissionAccessView);
        }

        ref.invalidate(authFormStepProvider);
      }
    } on String catch (message) {
      showError(context, message);
    } on IncorrectOtpException {
      setState(() {
        enteredWrongPin = true;
      });
    } catch (e) {
      showError(context, "Verification failed");
    }
  }

  bool enteredWrongPin = false;

  /// [on tap textField]
  void onTapTextField() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    final popupItems = [
      const PopupMenuItem(
        value: 'paste',
        child: Text('Paste'),
      ),
    ];

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + 40,
        offset.dx + 40,
        offset.dy,
      ),
      items: popupItems,
    ).then((value) {
      if (value == 'paste') {
        setOtpToTextFields();
      }
    });
  }

  void setOtpToTextFields() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null && data.text != null) {
      final newCode = data.text!;

      try {
        final code = int.parse(newCode);

        for (int i = 0; i < newCode.length; i++) {
          final digit = newCode[i];
          controllers[i].text = digit;
        }
      } catch (e) {
        if (mounted) {
          showError(context, "Invalid otp!");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formModel = ref.watch(authFormModelProvider);
    final selectedCountry = ref.watch(selectedCountryProvider);

    return Column(
      children: [
        Text(
          "One Time Password",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        16.hb,

        SizedBox(
          width: 294.w,
          child: Text(
            "We’ve sent an SMS with an activation code to your phone ${selectedCountry?.code}-${formModel.phNumber}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        16.hb,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var index = 0; index < focusNodes.length; index++)
              GestureDetector(
                onTap: () =>
                    // Enable the keyboard when tapped
                    FocusScope.of(context).requestFocus(focusNodes[index]),
                onLongPress: () =>
                    // Show the paste popup without enabling the keyboard
                    onTapTextField(),
                child: Column(
                  children: [
                    Container(
                      width: 40.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: enteredWrongPin
                              ? R.colors.red_FFFF0D46
                              : R.colors.grey_FFE8E8E8,
                        ),
                        color: R.colors.grey_FFE8E8E8,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: AbsorbPointer(
                        absorbing: true,
                        child: TextFormField(
                          maxLength: 1,
                          maxLines: 1,
                          enableInteractiveSelection: false,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              if (index < focusNodes.length - 1) {
                                focusNodes[index + 1].requestFocus();
                              } else {
                                focusNodes[index].unfocus();
                              }
                            } else {
                              if (index > 0) {
                                focusNodes[index - 1].requestFocus();
                              }
                            }
                          },
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          cursorColor: Colors.transparent,
                          decoration: const InputDecoration(
                            counter: SizedBox(),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),

        16.hb,

        if (enteredWrongPin)
          Container(
            margin: EdgeInsets.only(bottom: 16.w),
            child: Text(
              "Wrong OTP entered",
              style: TextStyle(
                color: R.colors.red_FFFF0D46,
                fontSize: 10.sp,
              ),
            ),
          ),

        /// [Resend Code]
        const ResendOtpCodeWidget(),

        16.hb,

        /// [Next Button]
        RadiusButton(
          width: 178.w,
          height: 50.h,
          color: R.colors.lavenderBlue_FF966EC3,
          text: "Next",
          loadingEnabled: true,
          onPressed: () => verifyOtp(context),
          fontSize: 18.sp,
        ),
      ],
    );
  }
}
