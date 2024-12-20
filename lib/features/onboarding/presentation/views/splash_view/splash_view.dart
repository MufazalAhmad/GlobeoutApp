import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/auth/presentation/providers/check_auth_provider.dart';
import 'package:globout/features/home/presentation/providers/permission_holder_model_provider.dart';
import 'package:globout/features/rive/presentation/providers/rive_provider.dart';
import 'package:globout/features/rive/presentation/providers/splash_screen_riv_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart' as rive;

import '../../../../../util/resource/r.dart';
import '../../../../../util/router/paths.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() async {
      await loadRiveAndNavigate();
      loadAuth();
      loadPermissions();
    });
  }

  Future<void> loadPermissions() async {
    await ref.read(permissionModelProvider.notifier).init();
  }

  Future<void> loadRiveAndNavigate() async {
    final timeWhenStarted = DateTime.now();

    await ref.read(riveBoardProvider.notifier).loadRive();

    final timeWhenEnded = DateTime.now();

    final timeDifference = timeWhenEnded.difference(timeWhenStarted);

    if (timeDifference.inSeconds < 4) {
      await Future.delayed(
        Duration(
          seconds: 4 - timeDifference.inSeconds,
        ),
      );
    }
  }

  Future<void> loadAuth() async {
    final auth = await ref.read(checkAuthProvider.future);
    if (mounted) {
      GoRouter.of(context).pushReplacement(
        auth ? RoutePaths.permissionAccessView : RoutePaths.onboard,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loadedRive = ref.watch(splashScreenRivProvider);

    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              R.colors.jetBlack_FF2E2E2E,
              R.colors.jetBlack_FF2E2E2E,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: loadedRive != null
            ? rive.Rive(
                artboard: loadedRive.artboard,
                fit: BoxFit.cover,
              )
            : const SizedBox(),
      ),
    );
  }
}
