import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/about/presentation/views/about/popups/privacy_policy_dialog.dart';
import 'package:globout/features/about/presentation/views/about/popups/terms_and_conditions_dialog.dart';
import 'package:globout/features/auth/presentation/providers/logout_provider.dart';
import 'package:globout/features/settings/presentation/views/settings/popups/help_and_support_dialog.dart';
import 'package:globout/features/settings/presentation/views/settings/popups/logout_dialog.dart';
import 'package:globout/features/settings/presentation/views/settings/popups/report_problem_dialog.dart';
import 'package:globout/features/settings/presentation/views/settings/wigdets/settings_tile_widget.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.jetBlack_FF2E2E2E,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                24.hb,

                /// [Back]
                GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 28.r,
                        child: Icon(
                          Icons.chevron_left,
                          color: R.colors.white_FFF5F5F5,
                        ),
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: R.colors.white_FFF5F5F5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 28.r)
                    ],
                  ),
                ),

                20.hb,

                /// [Account]
                Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: R.colors.white_FFF5F5F5,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                104.hb,

                /// [Body]
                /// [Privacy]
                SettingsTileWidget(
                  title: "Privacy",
                  svgIcon: R.svgs.PRIVACY_ICON,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const PrivacyPolicyDialog(showButton: false);
                      },
                    );
                  },
                ),

                28.hb,

                /// [Actions]
                Text(
                  "Ambassador",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: R.colors.white_FFF5F5F5,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                36.hb,

                /// [Help & Support]
                SettingsTileWidget(
                  title: "Help & Support",
                  svgIcon: R.svgs.HELP_ICON,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const HelpAndSupportDialog();
                      },
                    );
                  },
                ),

                25.hb,

                /// [Terms and Policies]
                SettingsTileWidget(
                  title: "Terms and Policies",
                  svgIcon: R.svgs.TCS_ICON,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const TermsAndConditionsDialog(
                            showButton: false);
                      },
                    );
                  },
                ),

                28.hb,

                /// [Actions]
                Text(
                  "Actions",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: R.colors.white_FFF5F5F5,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                36.hb,

                /// [Report a problem]
                SettingsTileWidget(
                  title: "Report a problem",
                  svgIcon: R.svgs.FLAG_ICON,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ReportProblemDialog();
                      },
                    );
                  },
                ),

                25.hb,

                /// [Logout]
                SettingsTileWidget(
                  title: "Logout",
                  svgIcon: R.svgs.LOGOUT_ICON,
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LogoutDialog();
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
