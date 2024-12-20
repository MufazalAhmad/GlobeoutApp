import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/onboarding/presentation/providers/onboard_pager_provider.dart';
import 'package:globout/features/onboarding/presentation/providers/terms_accepted_provider.dart';
import 'package:globout/util/resource/r.dart';

class RoundBorderedButton extends ConsumerStatefulWidget {
  const RoundBorderedButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  ConsumerState<RoundBorderedButton> createState() =>
      _RoundBorderedButtonState();
}

class _RoundBorderedButtonState extends ConsumerState<RoundBorderedButton> {
  var sizeOfButton = 42.r;
  var spaceBorder = 4.r;

  void up() {
    setState(() {
      sizeOfButton = 42.r;
      spaceBorder = 4.r;
    });
  }

  void down() {
    setState(() {
      sizeOfButton = 36.r;
      spaceBorder = 8.r;
    });
  }

  bool visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1300), () {
      setState(() {
        visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final terms = ref.watch(termsAcceptedProvider);
    final pager = ref.watch(onboardPagerProvider);

    final shouldGo =
        pager == 5 ? visible && terms.accepted && terms.aboveAge : visible;

    return GestureDetector(
      onTapDown: (_) => down(),
      onTapCancel: () => up(),
      onTapUp: (_) {
        if (!shouldGo) return;
        up();
        widget.onPressed();
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: shouldGo ? 1 : 0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(spaceBorder),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(
              color: R.colors.white_FFF5F5F5,
              width: 2.r,
            ),
          ),
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: R.colors.white_FFF5F5F5,
              ),
              width: sizeOfButton,
              height: sizeOfButton,
              child: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ),
    );
  }
}
