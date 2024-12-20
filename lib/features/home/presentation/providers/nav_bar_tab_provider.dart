import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/home/domain/models/home_nav_bar_index.dart';

class NavBarIndexNotifier extends StateNotifier<HomeNavBarIndex?> {
  NavBarIndexNotifier() : super(null);

  void change(HomeNavBarIndex item) {
    state = item;
  }

  void clear() {
    state = null;
  }

  HomeNavBarIndex? get index => state;
}

final navBarIndexProvider =
    StateNotifierProvider<NavBarIndexNotifier, HomeNavBarIndex?>(
  (ref) => NavBarIndexNotifier(),
);
