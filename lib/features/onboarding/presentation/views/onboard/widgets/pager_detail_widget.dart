import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/animated_toggle_button.dart';
import 'package:globout/features/onboarding/presentation/providers/terms_accepted_provider.dart';
import 'package:globout/features/onboarding/presentation/views/onboard/dialogs/terms_conditions_dialog.dart';
import 'package:globout/util/resource/r.dart';
import 'package:google_fonts/google_fonts.dart';

class PagerDetailWidget extends ConsumerStatefulWidget {
  final int page;

  const PagerDetailWidget({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  ConsumerState<PagerDetailWidget> createState() => _PagerDetailWidgetState();
}

class _PagerDetailWidgetState extends ConsumerState<PagerDetailWidget> {
  final List<String> titles = [
    "Welcome to Globout",
    "In one Click",
    "Spontaneity",
    "Trust",
    "Privacy",
  ];

  final List<String> descriptions = [
    "Creating the one social media\nthat really makes you social 💜",
    "You know where your friends are\nwhat they are up to, and how you\ncan meet them.",
    "Tell your friends when you are up\nto meet, and see them right away",
    "You share your information\nselectively with those you\ntrust.",
    "Your precise location remains\nconfidential. You have the control\nover the amount of information you share.",
  ];

  String get title => titles[widget.page - 1];

  String get description => descriptions[widget.page - 1];

  void _showTermsAndConditionsDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return const TermsAndConditionsDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// [title]
        Text(
          title,
          style: GoogleFonts.nunito(
            color: R.colors.white_FFF5F5F5,
            fontWeight: FontWeight.bold,
            fontSize: 28.sp,
          ),
        ),

        10.hb,

        /// [description]
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: R.colors.white_FFF5F5F5,
              fontWeight: FontWeight.w400,
              fontSize: 17.sp,
            ),
          ),
        ),

        20.hb,

        /// [AnimatedToggleButtons]
        if (widget.page == 5)
          Consumer(
            builder: (context, ref, _) {
              final terms = ref.watch(termsAcceptedProvider);

              return Column(
                children: [
                  /// [I am older than 16]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedToggleButton(
                        isSwitched: terms.aboveAge,
                        onChanged: (value) {
                          ref
                              .read(termsAcceptedProvider.notifier)
                              .aboveAgeToggle();
                        },
                      ),
                      13.wb,
                      Text(
                        "I am older than 16",
                        style: TextStyle(
                          color: R.colors.white_FFF5F5F5,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  10.hb,

                  /// [Terms & conditions]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedToggleButton(
                        isSwitched: terms.accepted,
                        onChanged: (value) {
                          ref
                              .read(termsAcceptedProvider.notifier)
                              .acceptToggle();
                        },
                      ),
                      13.wb,
                      InkWell(
                        onTap: _showTermsAndConditionsDialog,
                        child: Text(
                          "Terms & conditions",
                          style: TextStyle(
                            color: R.colors.white_FFF5F5F5,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
      ],
    );
  }
}
