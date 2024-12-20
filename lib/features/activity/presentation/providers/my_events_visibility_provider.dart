import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/domain/usecases/update_activity.dart';
import 'package:globout/util/di/di.dart';

class _MyEventsVisibilityNotifier extends StateNotifier<bool> {
  _MyEventsVisibilityNotifier() : super(true);

  bool get isOn => state;

  bool get isOff => !state;

  void on() {
    state = true;
  }

  void off() {
    state = false;
  }

  void toggle(EventModel event) {
    isOn ? off() : on();
    final updateActivity = sl<UpdateActivityUsecase>();
    updateActivity(UpdateActivityUsecaseInput(id: event.id));
  }

  Future<void> set(bool value) async {
    state = value;
  }
}

final myEventsVisibilityProvider =
    StateNotifierProvider<_MyEventsVisibilityNotifier, bool>(
        (ref) => _MyEventsVisibilityNotifier());
