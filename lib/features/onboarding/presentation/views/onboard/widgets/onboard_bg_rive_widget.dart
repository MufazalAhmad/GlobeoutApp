import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/rive/presentation/providers/onboard_pager_bg_riv_provider.dart';
import 'package:globout/features/rive/presentation/providers/rive_provider.dart';
import 'package:rive/rive.dart';

class OnboardBgRiveWidget extends ConsumerStatefulWidget {
  const OnboardBgRiveWidget({super.key});

  @override
  ConsumerState<OnboardBgRiveWidget> createState() =>
      _OnboardBgRiveWidgetState();
}

class _OnboardBgRiveWidgetState extends ConsumerState<OnboardBgRiveWidget> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      final riveFile = ref.read(riveBoardProvider.notifier).file;
      ref.read(onboardPagerBgRivProvider.notifier).loadRive(riveFile: riveFile!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loadedRive = ref.watch(onboardPagerBgRivProvider);
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: loadedRive != null
          ? Rive(
              artboard: loadedRive.artboard,
              fit: BoxFit.cover,
            )
          : const SizedBox(),
    );
  }
}
