import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/user/user.dart';

class UserProviderNotifier extends StateNotifier<User?> {
  UserProviderNotifier() : super(null);

  void setUser(User user) {
    state = user;
  }

  void removeUser() {
    state = null;
  }

  void updateName(String name) {
    state = state!.copyWith(name: name);
  }

  void updateInitialInvitesSent() {
    state = state!.copyWith(initialInvitesSent: true);
  }

  User? get user => state;
}

final userProvider = StateNotifierProvider<UserProviderNotifier, User?>((ref) {
  final notifier = UserProviderNotifier();
  return notifier;
});
