import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:screenshot/screenshot.dart';

class _EventModelsNotifier extends StateNotifier<List<EventModel>> {
  _EventModelsNotifier() : super([]);

  final ScreenshotController _controller = ScreenshotController();

  ScreenshotController get screenshotController => _controller;

  Future<void> setAll(List<EventModel> events) async {
    await Future.delayed(const Duration(milliseconds: 200));

    state = events;
  }

  @visibleForTesting
  void setAllDirectly(List<EventModel> events) {
    state = events;
  }

  void updateMarkerIcon(Uint8List icon, EventModel eventModel) {
    state = state.map((e) {
      final isSameEvent = e.id == eventModel.id;

      if (isSameEvent) {
        return e.copyWith(markerImage: icon);
      } else {
        return e;
      }
    }).toList();
  }

  List<EventModel> get getList => state;
}

final eventModelsProvider =
    StateNotifierProvider<_EventModelsNotifier, List<EventModel>>(
  (ref) {
    final notifier = _EventModelsNotifier();

    return notifier;
  },
);
