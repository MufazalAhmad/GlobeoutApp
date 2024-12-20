import 'package:globout/features/about/presentation/views/about/about_view.dart';
import 'package:globout/features/auth/presentation/views/enter_phone_view/enter_phone_view.dart';
import 'package:globout/features/friends/presentation/views/add_friends_view/add_friends_view.dart';
import 'package:globout/features/friends/presentation/views/community/community_view.dart';
import 'package:globout/features/friends/presentation/views/contacts/contacts_view.dart';
import 'package:globout/features/home/presentation/views/home_view/home_view.dart';
import 'package:globout/features/home/presentation/views/permissions_access_view/permissions_access_view.dart';
import 'package:globout/features/onboarding/presentation/views/onboard/onboard_view.dart';
import 'package:globout/features/onboarding/presentation/views/splash_view/splash_view.dart';
import 'package:globout/features/settings/presentation/views/settings/settings_view.dart';
import 'package:globout/features/auth/presentation/views/update_profile/update_profile_view.dart';
import 'package:globout/util/router/paths.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutePaths.onboard,
      builder: (context, state) => const OnboardView(),
    ),
    GoRoute(
      path: RoutePaths.enterPhone,
      builder: (context, state) => const EnterPhoneView(),
    ),
    GoRoute(
      path: RoutePaths.permissionAccessView,
      builder: (context, state) => const PermissionAccessView(),
    ),
    GoRoute(
      path: RoutePaths.homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: RoutePaths.addFriendsView,
      builder: (context, state) => const AddFriendsView(),
    ),
    GoRoute(
      path: RoutePaths.aboutView,
      builder: (context, state) => const AboutView(),
    ),
    GoRoute(
      path: RoutePaths.communityView,
      builder: (context, state) => const CommunityView(),
    ),
    GoRoute(
      path: RoutePaths.updateProfileView,
      builder: (context, state) => const UpdateProfileView(),
    ),
    GoRoute(
      path: RoutePaths.settingsView,
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      path: RoutePaths.contactsView,
      builder: (context, state) => const ContactsView(),
    )
  ],
);
