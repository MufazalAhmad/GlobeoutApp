import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/rive/presentation/providers/onboard_pager_bg_riv_provider.dart';
import 'package:globout/features/onboarding/presentation/providers/onboard_pager_provider.dart';
import 'package:globout/features/rive/presentation/providers/onboard_riv_provider.dart';
import 'package:globout/features/onboarding/presentation/views/onboard/widgets/onboard_bg_rive_widget.dart';
import 'package:globout/features/onboarding/presentation/views/onboard/widgets/onboard_rive_widget.dart';
import 'package:globout/features/onboarding/presentation/views/onboard/widgets/pager_detail_widget.dart';
import 'package:globout/util/resource/r.dart';
import 'package:globout/util/router/paths.dart';
import 'package:go_router/go_router.dart';

import 'widgets/pager_indicator_widget.dart';
import 'widgets/round_bordered_button.dart';

class OnboardView extends ConsumerWidget {
  const OnboardView({super.key});

  void nextPage(WidgetRef ref, BuildContext context) {
    final count = ref.read(onboardPagerProvider.notifier).count;
    if (count == 5) {
      GoRouter.of(context).pushReplacement(RoutePaths.enterPhone);
      return;
    }
    ref.read(onboardPagerProvider.notifier).next();
    ref.read(onboardRivProvider.notifier).next();
    ref.read(onboardPagerBgRivProvider.notifier).next();
  }

  void onSwipeRight(
      DragEndDetails details, WidgetRef ref, BuildContext context) {
    final pageCount = ref.read(onboardPagerProvider.notifier).count;

    if (pageCount == 5) {
      return;
    } else {
      if (details.primaryVelocity != null) {
        if (details.primaryVelocity! > 0) {
          /// [User swiped Left]
          //TODO:
        } else if (details.primaryVelocity! < 0) {
          /// [User swiped Right]
          nextPage(ref, context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: R.colors.jetBlack_FF2E2E2E,
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) =>
            onSwipeRight(details, ref, context),
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              const OnboardBgRiveWidget(),

              /// [Body]
              SizedBox(
                height: 1.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(flex: 3),

                    /// [Rive for onboarding animations]
                    const OnboardRiveWidget(),

                    const Spacer(flex: 6),

                    Consumer(
                      builder: (context, ref, _) {
                        final count = ref.watch(onboardPagerProvider);
                        return PagerDetailWidget(page: count);
                      },
                    ),

                    const Spacer(flex: 6),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 31.w),
                      child: Consumer(
                        builder: (context, ref, _) {
                          final count = ref.watch(onboardPagerProvider);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PagerIndicatorWidget(
                                pageCount: 5,
                                currentPage: count,
                              ),
                              RoundBorderedButton(
                                onPressed: () => nextPage(ref, context),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
