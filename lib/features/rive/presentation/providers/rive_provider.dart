import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/util/resource/r.dart';
import 'package:rive/rive.dart';

class RiveBoardNotifier extends StateNotifier<RiveFile?> {
  RiveBoardNotifier() : super(null);

  Future<void> loadRive() async {
    final loadedRiveBytes = await rootBundle.load(R.rivs.GLOBOUT);
    final riveFile = RiveFile.import(loadedRiveBytes);

    state = riveFile;
  }

  RiveFile? get file => state;
}

final riveBoardProvider = StateNotifierProvider<RiveBoardNotifier, RiveFile?>(
  (ref) => RiveBoardNotifier(),
);
