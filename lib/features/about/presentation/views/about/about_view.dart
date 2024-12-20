import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/app_outlined_button.dart';
import 'package:globout/common/widgets/radius_button.dart';
import 'package:globout/features/about/presentation/providers/bottom_bar_appear_provider.dart';
import 'package:globout/features/about/presentation/views/about/popups/privacy_policy_dialog.dart';
import 'package:globout/features/about/presentation/views/about/popups/terms_and_conditions_dialog.dart';
import 'package:globout/features/about/presentation/views/about/widgets/blue_radial_gradient.dart';
import 'package:globout/features/about/presentation/views/about/widgets/sliver_persistance_header.dart';
import 'package:globout/features/auth/presentation/views/enter_phone_view/widgets/bg_jetblack_gradient.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends ConsumerStatefulWidget {
  const AboutView({super.key});

  @override
  ConsumerState<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends ConsumerState<AboutView> {
  late final ScrollController scrollController;
  String content = '';

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    loadContent();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      ref.read(bottomBarAppearProvider.notifier).shouldNotAppear();
    } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        scrollController.position.pixels !=
            scrollController.position.maxScrollExtent) {
      ref.read(bottomBarAppearProvider.notifier).shouldAppear();
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> loadContent() async {
    final loadedContent = await rootBundle.loadString(
      R.txts.PRIVACY_POLICY,
    );

    setState(() {
      content = loadedContent;
    });
  }

  Future<void> _emailTo() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'help@abcdefg.com',
      query:
          encodeQueryParameters(<String, String>{'subject': 'Example Subject'}),
    );
    try {
      if (await canLaunchUrl(params)) {
        await launchUrl(params);
      } else {
        if (mounted) {
          showError(
            context,
            "Could not launch",
          );
        }
      }
    } catch (e) {
      showError(
        context,
        "Could not launch $e",
      );
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
    final isVisible = ref.watch(bottomBarAppearProvider);

    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            /// [Background Gradient]
            const BgJetblackGradientWidget(),

            /// [Top Blue Radial Gradient]
            BlueRadialGradientWidget(
              top: -44.h,
              right: -211.w,
            ),

            /// [Bottom Blue Radial Gradient]
            BlueRadialGradientWidget(
              bottom: 55.h,
              left: -155.w,
            ),

            /// [Body]
            Container(
              padding: EdgeInsets.only(top: 36.h),
              child: Stack(
                children: [
                  CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      /// [About Us Heading]
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: SliverAppBarDelegate(
                          minHeight: 70.h,
                          maxHeight: 70.h,
                          child: InkWell(
                            onTap: () => GoRouter.of(context).pop(),
                            child: Padding(
                              padding: EdgeInsets.only(left: 22.w, right: 22.w),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.chevron_left,
                                    size: 28.r,
                                    color: R.colors.white_FFF5F5F5,
                                  ),
                                  Text(
                                    "Back",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: R.colors.white_FFF5F5F5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// [App Image]
                      SliverPersistentHeader(
                        pinned: false,
                        delegate: SliverAppBarDelegate(
                          minHeight: 0,
                          maxHeight: 189.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 26.w),
                            child: Image.asset(R.pngs.LOGO),
                          ),
                        ),
                      ),

                      /// [App Title]
                      SliverPersistentHeader(
                        pinned: false,
                        delegate: SliverAppBarDelegate(
                          minHeight: 0,
                          maxHeight: 60.h,
                          child: Center(
                            child: Text(
                              "Globout",
                              style: TextStyle(
                                fontSize: 31.sp,
                                color: R.colors.white_FFF5F5F5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// [Privacy Policy Text]
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            17.hb,

                            /// [Privacy Policy]
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 19.w),
                              child: Text(
                                content,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: R.colors.white_FFF5F5F5,
                                  letterSpacing: 0.14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            250.hb,
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// [Contact Us Block]
                  AnimatedPositioned(
                    bottom: isVisible ? 0.h : -190.h,
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      height: 215.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22.r),
                          topRight: Radius.circular(22.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(5, -5),
                            color: Colors.grey.withOpacity(0.25),
                            blurRadius: 4.0,
                            spreadRadius: 4.0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 26.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /// [Contact Us]
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Contact us",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: R.colors.jetBlack_FF2E2E2E,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " at ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: R.colors.orchid_FFDE6CBA,
                                    ),
                                  ),

                                  /// [Contact Email]
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => _emailTo(),
                                    text: "help@abcdefg.com",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: R.colors.orchid_FFDE6CBA,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            19.hb,

                            /// [Privacy Policy Button]
                            RadiusButton(
                              text: "Privacy Policy",
                              color: R.colors.orchid_FFDE6CBA,
                              width: 327.w,
                              height: 48.h,
                              textStyle: TextStyle(
                                color: R.colors.white_FFF5F5F5,
                                fontSize: 14.sp,
                              ),
                              onPressed: () {
                                /// [Privacy Policy Dialog]
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const PrivacyPolicyDialog();
                                  },
                                );
                              },
                            ),

                            14.hb,

                            AppOutlinedButton(
                              text: "Terms & Conditions",
                              width: 327.w,
                              height: 48.h,
                              textStyle: TextStyle(
                                color: R.colors.orchid_FFDE6CBA,
                                fontSize: 14.sp,
                              ),
                              bgColor: R.colors.white_FFF5F5F5,
                              color: R.colors.orchid_FFDE6CBA,
                              onPressed: () {
                                /// [Terms & Conditions Dialog]
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const TermsAndConditionsDialog();
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
