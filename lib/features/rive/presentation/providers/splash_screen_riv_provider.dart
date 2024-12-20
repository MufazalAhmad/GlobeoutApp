import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/onboarding/domain/models/loaded_rive.dart';
import 'package:globout/features/rive/presentation/providers/rive_provider.dart';
import 'package:rive/rive.dart';

final splashScreenRivProvider = Provider((ref) {
  final rive = ref.watch(riveBoardProvider);
  if (rive == null) {
    return null;
  }

  final artBoard = rive.artboardByName('splash');

  assert(artBoard != null);

  final controller = StateMachineController.fromArtboard(artBoard!, 'machine');

  assert(controller != null);

  artBoard.addController(controller!);

  return LoadedRive(
    artboard: artBoard,
    controller: controller,
  );
});
