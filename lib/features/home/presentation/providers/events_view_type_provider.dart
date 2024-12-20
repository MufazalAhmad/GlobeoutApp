import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/home/domain/enum/events_view_type.dart';

class EventViewTypeNotifier extends StateNotifier<EventsViewType> {
  EventViewTypeNotifier() : super(EventsViewType.map);

  void switchToMap() {
    state = EventsViewType.map;
  }

  void switchToList() {
    state = EventsViewType.list;
  }

  void toggleEventsView() {
    if (state.isMap) {
      switchToList();
    } else {
      switchToMap();
    }
  }
}

final eventsViewTypeProvider =
    StateNotifierProvider<EventViewTypeNotifier, EventsViewType>(
  (ref) => EventViewTypeNotifier(),
);
