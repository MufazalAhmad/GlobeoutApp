import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/auth/domain/models/auth_form_step/auth_form_step.dart';
import 'package:globout/features/auth/presentation/providers/auth_form_step_provider.dart';
import 'package:globout/features/auth/presentation/views/enter_phone_view/widgets/blue_radial_gradient.dart';
import 'package:globout/util/resource/r.dart';

import 'widgets/app_logo_widget.dart';
import 'widgets/bg_jetblack_gradient.dart';
import 'widgets/enter_name_sheet_widget.dart';
import 'widgets/enter_phone_sheet_widget.dart';
import 'widgets/enter_pin_sheet.dart';

class EnterPhoneView extends ConsumerWidget {
  const EnterPhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          /// [BG Gradient]
          const BgJetblackGradientWidget(),

          /// [Blue Radical Gradient]
          const BlueRadialGradientWidget(),

          /// [Body]
          SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Consumer(
                        builder: (context, ref, _) {
                          final step = ref.watch(authFormStepProvider);

                          return !step.isEnterOTP
                              ? const SizedBox()
                              : InkWell(
                                  onTap: () {
                                    ref
                                        .read(authFormStepProvider.notifier)
                                        .setStep(AuthFormStep.enterPhone);
                                  },
                                  child: Container(
                                    width: 72.w,
                                    height: 30.h,
                                    margin:
                                        EdgeInsets.only(left: 23.w, top: 10.h),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(
                                          "Back",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                    77.hb,

                    /// [Logo]
                    const AppLogoWidget(),

                    /// [Globout]
                    SizedBox(
                      width: 148.w,
                      height: 66.31.h,
                      child: Center(
                        child: Text(
                          "Globout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    /// [White Sheet Form]
                    Container(
                      width: 344.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 23.h),
                      decoration: BoxDecoration(
                        color: R.colors.white_FFF5F5F5,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Consumer(
                        builder: (context, ref, _) {
                          final step = ref.watch(authFormStepProvider);

                          if (step.isEnterPhone) {
                            return const EnterPhoneSheetWidget();
                          } else if (step.isEnterOTP) {
                            return const EnterPinSheetWidget();
                          } else if (step.isEnterName) {
                            return const EnterNameSheetWidget();
                          }

                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
