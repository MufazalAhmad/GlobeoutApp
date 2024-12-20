import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/rive/presentation/providers/onboard_riv_provider.dart';
import 'package:globout/features/rive/presentation/providers/rive_provider.dart';
import 'package:rive/rive.dart';

class OnboardRiveWidget extends ConsumerStatefulWidget {
  const OnboardRiveWidget({super.key});

  @override
  ConsumerState<OnboardRiveWidget> createState() => _OnboardRiveWidgetState();
}

class _OnboardRiveWidgetState extends ConsumerState<OnboardRiveWidget> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      final riveFile = ref.read(riveBoardProvider.notifier).file;
      ref.read(onboardRivProvider.notifier).loadRiveFile(riveFile: riveFile!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loadedRive = ref.watch(onboardRivProvider);
    return Center(
      child: loadedRive != null
          ? SizedBox(
              width: 279.w,
              height: 300.h,
              child: Rive(
                artboard: loadedRive.artboard,
              ),
            )
          : const SizedBox(),
    );
  }
}
