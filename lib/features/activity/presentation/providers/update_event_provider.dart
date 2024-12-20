import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/usecases/update_cached_event.dart';
import 'package:globout/features/activity/domain/usecases/update_event.dart';
import 'package:globout/features/activity/presentation/providers/create_activity_form_provider.dart';
import 'package:globout/features/activity/presentation/providers/selected_activities_for_create_activity_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/location/domain/usecases/get_current_location.dart';
import 'package:globout/util/di/di.dart';

import '../../../home/presentation/providers/current_user_event_provider.dart';

final updateEventProvider = FutureProvider.autoDispose<void>(
  (ref) async {
    final updateCachedEventUsecase = sl<UpdateCachedEventUsecase>();
    final updateEventUsecase = sl<UpdateEventUsecase>();

    /// [watch data]!
    final user = ref.watch(userProvider)!;
    final selectedActivities =
        ref.watch(selectedActivitiesForCreateActivityProvider);
    final form = ref.watch(createActivityFormProvider);

    final userEvent = ref.watch(currentUserEventProvider);

    final getCurrentLocationUsecase = sl<GetCurrentLocationUsecase>();
    final location =
        await getCurrentLocationUsecase(GetCurrentLocationUsecaseInput());

    /// [event input]
    final input = UpdateEventUsecaseInput(
      eventId: userEvent!.id,
      userId: user.id,
      activities: selectedActivities.map((e) => e.title).toList(),
      inMinutes: form.inHowManyMinutes!,
      forHours: form.forHowManyHours!,
      forAllFriends: form.forAllFriends!,
      lat: location.lat,
      lng: location.lng,
    );

    await updateEventUsecase(input);

    await updateCachedEventUsecase(
      UpdateCachedEventUsecaseInput(
        id: userEvent.id,
        updateEventInput: input,
        user: user,
      ),
    );
  },
);
