import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBarAppearNotifier extends StateNotifier<bool> {
  BottomBarAppearNotifier() : super(true);

  void shouldAppear() {
    state = true;
  }

  void shouldNotAppear() {
    state = false;
  }
}

final bottomBarAppearProvider =
    StateNotifierProvider<BottomBarAppearNotifier, bool>(
  (ref) {
    return BottomBarAppearNotifier();
  },
);
