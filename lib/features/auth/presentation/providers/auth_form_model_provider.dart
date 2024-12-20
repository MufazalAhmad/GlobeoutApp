import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/models/auth_form/auth_form_model.dart';

class _AuthFormModelNotifier extends StateNotifier<AuthFormModel> {
  _AuthFormModelNotifier() : super(AuthFormModel());

  void setPhoneNumber(String phoneNumber) {
    state = state.copyWith(phNumber: phoneNumber);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setProfileImage(String profileImage) {
    state = state.copyWith(image: profileImage);
  }

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  String? get phoneNumber => state.phNumber;

  String? get name => state.name;

  String? get image => state.image;

  String? get username => state.username;

  String? get email => state.email;
}

final authFormModelProvider =
    StateNotifierProvider<_AuthFormModelNotifier, AuthFormModel>((ref) {
  return _AuthFormModelNotifier();
});
