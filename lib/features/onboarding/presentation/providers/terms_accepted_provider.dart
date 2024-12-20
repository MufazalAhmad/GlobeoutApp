import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/onboarding/domain/models/terms_mode/terms_model.dart';

class TermsAcceptedNotifier extends StateNotifier<TermsModel> {
  TermsAcceptedNotifier() : super(TermsModel());

  void acceptToggle() {
    state = state.copyWith(accepted: !state.accepted);
  }

  void aboveAgeToggle() {
    state = state.copyWith(aboveAge: !state.aboveAge);
  }

  TermsModel get terms => state;
}

final termsAcceptedProvider =
    StateNotifierProvider<TermsAcceptedNotifier, TermsModel>((ref) {
  return TermsAcceptedNotifier();
});
