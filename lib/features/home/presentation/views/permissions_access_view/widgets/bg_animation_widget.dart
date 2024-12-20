import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/rive/presentation/providers/access_contacts_bg_riv_provider.dart';
import 'package:rive/rive.dart';

class BgAnimationWidget extends ConsumerStatefulWidget {
  const BgAnimationWidget({super.key});

  @override
  ConsumerState<BgAnimationWidget> createState() => _BgAnimationWidgetState();
}

class _BgAnimationWidgetState extends ConsumerState<BgAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    final loadedRiv = ref.watch(AccessContactsBgRivProviderallowAccess);

    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: loadedRiv == null
          ? const SizedBox()
          : Rive(
              artboard: loadedRiv.artboard,
              fit: BoxFit.cover,
            ),
    );
  }
}
