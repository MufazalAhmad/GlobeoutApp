import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunitySwitchProvider extends StateNotifier<bool> {
  CommunitySwitchProvider() : super(false);

  void switchCommunity() {
    if (state) {
      state = false;
    } else {
      state = true;
    }
  }
}

final communitySwitchProvider =
    StateNotifierProvider<CommunitySwitchProvider, bool>(
  (ref) {
    return CommunitySwitchProvider();
  },
);
