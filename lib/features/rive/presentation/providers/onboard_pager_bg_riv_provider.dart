import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/onboarding/domain/models/loaded_rive.dart';
import 'package:rive/rive.dart';

class _OnboardPagerBgRivNotifier extends StateNotifier<LoadedRive?> {
  _OnboardPagerBgRivNotifier() : super(null);

  Future<void> loadRive({required RiveFile riveFile}) async {
    final artboard = riveFile.artboardByName('onboard-background');

    assert(artboard != null);

    final controller =
        StateMachineController.fromArtboard(artboard!, 'State Machine 1');

    assert(controller != null);

    artboard.addController(controller!);

    state = LoadedRive(
      artboard: artboard,
      controller: controller,
    );
  }

  void next() {
    final input = loadedRive.controller.inputs.first;
    if (input.value < 5) {
      input.value = (input.value + 1);
    }
  }

  LoadedRive get loadedRive => state!;
}

final onboardPagerBgRivProvider =
    StateNotifierProvider<_OnboardPagerBgRivNotifier, LoadedRive?>(
  (ref) {
    return _OnboardPagerBgRivNotifier();
  },
);
