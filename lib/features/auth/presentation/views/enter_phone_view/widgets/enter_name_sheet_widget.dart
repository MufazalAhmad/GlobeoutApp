import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/radius_button.dart';
import 'package:globout/features/auth/presentation/providers/save_auth_provider.dart';
import 'package:globout/features/auth/presentation/providers/update_user_provider.dart';
import 'package:globout/util/resource/r.dart';
import 'package:globout/util/router/paths.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/auth_form_model_provider.dart';

class EnterNameSheetWidget extends ConsumerWidget {
  const EnterNameSheetWidget({super.key});

  Future<void> updateUser(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(updateUserProvider.future);
      await ref.read(saveAuthProvider.future);

      if (context.mounted) {
        GoRouter.of(context).pushReplacement(RoutePaths.permissionAccessView);
      }
    } on String catch (message) {
      showError(context, message);
    } catch (e) {
      showError(context, "Update failed");
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
          "Hi you! 💜",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        42.hb,

        Text(
          "How should we call you?",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        42.hb,

        /// [Name Field]
        Container(
          width: 251.w,
          height: 50.h,
          margin: EdgeInsets.symmetric(horizontal: 23.w),
          decoration: BoxDecoration(
            color: R.colors.grey_FFE8E8E8,
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: TextField(
            onChanged: (value) {
              ref.read(authFormModelProvider.notifier).setName(value);
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "Your name....",
              hintStyle: TextStyle(
                fontSize: 14.sp,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 23.w),
            ),
          ),
        ),

        42.hb,

        /// [Next Button]
        RadiusButton(
          width: 178.w,
          height: 50.h,
          color: R.colors.lavenderBlue_FF966EC3,
          text: "Next",
          loadingEnabled: true,
          onPressed: () => updateUser(context, ref),
          fontSize: 18.sp,
        ),
      ],
    );
  }
}
