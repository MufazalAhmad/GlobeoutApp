import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/onboarding/domain/models/loaded_rive.dart';
import 'package:rive/rive.dart';

class OnboardRivNotifier extends StateNotifier<LoadedRive?> {
  OnboardRivNotifier() : super(null);

  Future<void> loadRiveFile({required RiveFile riveFile}) async {
    final artboard = riveFile.artboardByName('onboard');

    assert(artboard != null);

    final controller =
        StateMachineController.fromArtboard(artboard!, 'machine');

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

final onboardRivProvider =
    StateNotifierProvider<OnboardRivNotifier, LoadedRive?>(
  (ref) => OnboardRivNotifier(),
);
