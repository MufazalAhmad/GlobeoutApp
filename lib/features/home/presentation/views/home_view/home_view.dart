import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globout/features/activity/presentation/providers/events_provider.dart';
import 'package:globout/features/activity/presentation/providers/my_events_visibility_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_connection_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/presentation/views/community/community_view.dart';
import 'package:globout/features/home/presentation/providers/location_provider.dart';
import 'package:globout/features/home/presentation/providers/nav_bar_tab_provider.dart';
import 'package:globout/features/home/presentation/providers/events_view_type_provider.dart';
import 'package:globout/features/home/presentation/views/home_view/widgets/home_map_view.dart';
import 'package:globout/features/home/presentation/views/home_view/widgets/nav_bar_widget.dart';
import 'package:globout/features/settings/presentation/views/account/account_view.dart';
import 'package:globout/util/resource/r.dart';
import 'package:globout/util/router/paths.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    navigateToAddFriendsView();
  }

  Future<void> navigateToAddFriendsView() async {
    await ref.read(locationProvider.future);
    final user = ref.read(userProvider.notifier).user;

    assert(user != null);
    ref.read(myEventsVisibilityProvider.notifier).set(user!.visible);

    if (!user.initialInvitesSent) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        GoRouter.of(context).push(RoutePaths.addFriendsView);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    ref.invalidate(userConnectionProvider);
    ref.invalidate(getEventsProvider);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userConnectionProvider);
    ref.watch(getEventsProvider);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: R.colors.charcoal_FF1A1A1A,
        body: Consumer(
          builder: (context, ref, _) {
            final navIndex = ref.watch(navBarIndexProvider);

            return Stack(
              children: [
                /// [Map]
                const HomeMapView(),

                /// [Community]
                if (navIndex?.isCommunity ?? false)
                  const CommunityView()

                /// [AccountView]
                else if (navIndex?.isAccount ?? false)
                  const AccountView(),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 140.h,
                    width: 1.sw,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        /// [Nav Bar Image]
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: 1.sw,
                            child: Image.asset(
                              R.pngs.NAV_BAR,
                              height: 90.h,
                              width: 1.sw,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        /// [Nav Bar Items]
                        Positioned(
                          bottom: 10.h,
                          left: 40.w,
                          right: 40.w,
                          child: const NavBarWidget(),
                        ),

                        /// [Home]
                        Positioned(
                          left: 158.w,
                          right: 158.w,
                          bottom: 75.h,
                          child: Consumer(builder: (context, ref, _) {
                            final eventViewType =
                                ref.watch(eventsViewTypeProvider);
                            return FloatingActionButton(
                              backgroundColor: eventViewType.isList
                                  ? R.colors.white_FFF5F5F5
                                  : R.colors.jetBlack_FF2E2E2E,
                              onPressed: () {
                                if (navIndex == null) {
                                  ref
                                      .read(eventsViewTypeProvider.notifier)
                                      .toggleEventsView();
                                } else {
                                  ref
                                      .read(navBarIndexProvider.notifier)
                                      .clear();
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 34.r,
                                    child: SvgPicture.asset(eventViewType.isMap
                                        ? R.svgs.EVENT_LIST_ICON
                                        : R.svgs.HOME),
                                  ),
                                  Text(
                                    eventViewType.isMap ? "List" : "Home",
                                    style: TextStyle(
                                      color: eventViewType.isList
                                          ? R.colors.jetBlack_FF2E2E2E
                                          : R.colors.white_FFFFFFFF,
                                      fontSize: 12.sp,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
