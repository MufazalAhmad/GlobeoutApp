import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/radius_button.dart';
import 'package:globout/features/auth/presentation/providers/logout_provider.dart';
import 'package:globout/util/resource/r.dart';
import 'package:globout/util/router/paths.dart';
import 'package:go_router/go_router.dart';

class LogoutDialog extends ConsumerStatefulWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  ConsumerState<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends ConsumerState<LogoutDialog> {
  Future<void> _logout(BuildContext context) async {
    try {
      await ref.read(logoutProvider.future);
      if (context.mounted) {
        GoRouter.of(context).pushReplacement(RoutePaths.enterPhone);
      }
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
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              37.25.hb,

              /// [Heading]
              Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: R.colors.jetBlack_FF2E2E2E,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

              14.hb,

              /// [Heading]
              Text(
                "Are you sure you want to log out?",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: R.colors.jetBlack_FF2E2E2E,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

              27.hb,

              /// [Logout Button]
              RadiusButton(
                text: "Logout",
                color: R.colors.orchid_FFDE6CBA,
                width: double.infinity,
                loadingEnabled: true,
                onPressed: () => _logout(context),
              ),

              32.hb,
            ],
          ),
        ),
      ),
    );
  }
}
