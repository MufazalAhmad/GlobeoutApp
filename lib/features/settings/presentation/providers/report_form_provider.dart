import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportFormNotifier extends StateNotifier<String?> {
  ReportFormNotifier() : super(null);

  void setDescription(String description) {
    state = description;
  }

  String? get description => state;
}

final reportFormProvider =
    StateNotifierProvider<ReportFormNotifier, String?>((ref) {
  return ReportFormNotifier();
});
