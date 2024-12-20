import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardPagerNotifier extends StateNotifier<int> {
  OnboardPagerNotifier() : super(1);

  void next() {
    if (state < 5) {
      state = (state + 1);
    }
  }

  void previous() {
    if (state > 1) {
      state = (state - 1);
    }
  }

  int get count => state;
}

final onboardPagerProvider = StateNotifierProvider<OnboardPagerNotifier, int>(
  (ref) => OnboardPagerNotifier(),
);
