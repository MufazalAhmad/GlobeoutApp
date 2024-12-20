import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/presentation/providers/selected_activities_for_filter_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/home/presentation/providers/event_models_provider.dart';

final filteredEventModelsProvider = Provider<List<EventModel>>(
  (ref) {
    final events = ref.watch(eventModelsProvider);
    final filter = ref.watch(selectedActivitiesForFilterProvider);
    final user = ref.watch(userProvider);
    final showAllFriends = filter.allFriends;

    final selectedActivities =
        filter.activities.where((element) => element.isSelected).toList();

    final eventsWhoseActivitySelected = events
        .where(
          (event) => selectedActivities.any(
            (filterActivity) => event.activities.any(
              (element) =>
                  element.toLowerCase() == filterActivity.title.toLowerCase(),
            ),
          ),
        )
        .toList();

    final excludingMe = eventsWhoseActivitySelected
        .where((element) => element.userId != user!.id)
        .toList();

    final visibleFiltered =
        excludingMe.where((element) => element.user.visible).toList();

    final onBasisOfMyFriendList = showAllFriends
        ? visibleFiltered
            .where((element) =>
                user!.friends.any((id) => id == element.userId) ||
                user.closeFriends.any((id) => id == element.userId))
            .toList()
        : visibleFiltered
            .where((element) =>
                user!.closeFriends.any((id) => id == element.userId))
            .toList();

    final onBasisOfHisFriendList = <EventModel>[];

    for (final event in onBasisOfMyFriendList) {
      final amInTheirFriends =
          event.user.friends.any((element) => element == user!.id);

      final amIInTheirCloseFriends =
          event.user.closeFriends.any((element) => element == user!.id);

      if ((event.forAllFriends &&
              (amInTheirFriends || amIInTheirCloseFriends)) ||
          (!event.forAllFriends && amIInTheirCloseFriends)) {
        onBasisOfHisFriendList.add(event);
      }
    }

    return onBasisOfHisFriendList;
  },
);
