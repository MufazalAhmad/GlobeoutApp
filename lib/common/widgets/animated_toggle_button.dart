import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/rive/presentation/providers/rive_provider.dart';
import 'package:rive/rive.dart';

class AnimatedToggleButton extends ConsumerStatefulWidget {
  const AnimatedToggleButton({
    super.key,
    this.isSwitched = false,
    this.onChanged,
  });

  final bool isSwitched;
  final Function(bool)? onChanged;

  @override
  ConsumerState<AnimatedToggleButton> createState() =>
      _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends ConsumerState<AnimatedToggleButton> {
  Artboard? _artboard;
  StateMachineController? _controller;
  SMIInput<bool>? _toggle;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _loadRiveFile();
    });
  }

  void _loadRiveFile() async {
    final riveFile = ref.read(riveBoardProvider.notifier).file;
    if (riveFile != null) {
      setState(() {
        _artboard = riveFile.artboardByName('toggle')!.instance();
        _controller =
            StateMachineController.fromArtboard(_artboard!, 'machine')!;
        _artboard!.addController(_controller!);
        _toggle = _controller!.findInput<bool>('toggle')!;
      });

      _toggle?.value = !widget.isSwitched;
    }
  }

  void checkAnimationState() {
    if (_toggle == null) return;
    if (_toggle!.value == widget.isSwitched) {
      _toggle?.value = !widget.isSwitched;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_artboard == null) return const SizedBox.shrink();
    checkAnimationState();
    return GestureDetector(
      onTap: () {
        _toggle?.value = !_toggle!.value;
        widget.onChanged?.call(_toggle!.value);
      },
      child: SizedBox(
        height: 30.h,
        width: 50.w,
        child: Rive(artboard: _artboard!),
      ),
    );
  }
}
