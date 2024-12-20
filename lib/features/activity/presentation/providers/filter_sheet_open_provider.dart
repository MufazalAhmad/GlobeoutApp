import 'package:flutter_riverpod/flutter_riverpod.dart';

class _FilterSheetOpenNotifier extends StateNotifier<bool> {
  _FilterSheetOpenNotifier() : super(false);

  void open() {
    if (!state) {
      state = true;
    }
  }

  void close() {
    if (state) {
      state = false;
    }
  }
}

final filterSheetOpenProvider =
    StateNotifierProvider<_FilterSheetOpenNotifier, bool>(
  (ref) => _FilterSheetOpenNotifier(),
);
