import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/models/activity.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/presentation/providers/all_activities_create_activity_provider.dart';
import 'package:globout/features/activity/presentation/providers/home_activity_form_dragger_is_open_provider.dart';
import 'package:globout/features/home/domain/models/create_activity_form_model.dart';
import 'package:globout/features/home/presentation/providers/current_user_event_provider.dart';

class CreateActivityFormNotifier
    extends StateNotifier<CreateActivityFormModel> {
  CreateActivityFormNotifier() : super(CreateActivityFormModel());

  void setActivities(List<ActivityModel> activities) {
    state = state.copyWith(activities: activities);
  }

  void setInHowManyMinutes(int minutes) {
    state = state.copyWith(inHowManyMinutes: minutes);
  }

  void setForHowManyHours(int hours) {
    state = state.copyWith(forHowManyHours: hours);
  }

  void setForAllFriends(bool forAllFriends) {
    state = state.copyWith(forAllFriends: forAllFriends);
  }

  void validate() {
    if (state.activities?.isEmpty ?? true) {
      throw "Select at least one activity";
    }
    if (state.forAllFriends == null) {
      throw "Choose to whom your activity is shown";
    }
    if (state.inHowManyMinutes == null) {
      throw "add, In how many minutes you want to leave";
    }

    if (state.forHowManyHours == null) {
      throw "add, For how many hours you want to leave";
    }
  }

  void reset() {
    state = CreateActivityFormModel();
  }

  void setEvent(EventModel event, List<ActivityModel> activities) {
    state = state.copyWith(
      activities: activities,
      forAllFriends: event.forAllFriends,
      forHowManyHours: event.forHours,
      inHowManyMinutes: event.inMinutes,
    );
  }
}

final createActivityFormProvider =
    StateNotifierProvider<CreateActivityFormNotifier, CreateActivityFormModel>(
  (ref) {
    final notifier = CreateActivityFormNotifier();

    ref.listen(allActivitiesCreateActivityProvider, (previous, next) {
      final selectedActivities = ref
          .read(allActivitiesCreateActivityProvider)
          .where((element) => element.isSelected)
          .toList();

      notifier.setActivities(selectedActivities);
    });

    ref.listen(homeActivityFormDraggerIsOpenProvider, (previous, isOpen) {
      final currentEvent = ref.read(currentUserEventProvider);
      if (!isOpen && (currentEvent == null)) {
        notifier.reset();
      }
    });

    return notifier;
  },
);
