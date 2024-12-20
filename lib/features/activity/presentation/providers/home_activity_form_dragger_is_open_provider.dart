import 'package:flutter_riverpod/flutter_riverpod.dart';

class _HomeActivityFormDraggerIsOpenProvider extends StateNotifier<bool> {
  _HomeActivityFormDraggerIsOpenProvider() : super(false);

  void open() {
    state = true;
  }

  void close() {
    state = false;
  }

  void toggle() {
    if (state) {
      close();
    } else {
      open();
    }
  }

  bool get value => state;
}

final homeActivityFormDraggerIsOpenProvider =
    StateNotifierProvider<_HomeActivityFormDraggerIsOpenProvider, bool>(
  (ref) => _HomeActivityFormDraggerIsOpenProvider(),
);
