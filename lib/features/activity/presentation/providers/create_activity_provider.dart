import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/usecases/create_activity.dart';
import 'package:globout/features/activity/domain/usecases/cache_create_event.dart';
import 'package:globout/features/activity/presentation/providers/create_activity_form_provider.dart';
import 'package:globout/features/activity/presentation/providers/selected_activities_for_create_activity_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/location/domain/usecases/get_current_location.dart';
import 'package:globout/util/di/di.dart';

final createActivityProvider = FutureProvider.autoDispose<void>(
  (ref) async {
    final cacheEventUsecase = sl<CacheCreateEventUsecase>();
    final createEventUsecase = sl<CreateEventUsecase>();

    /// [watch data]!
    final user = ref.watch(userProvider)!;
    final selectedActivities =
        ref.watch(selectedActivitiesForCreateActivityProvider);
    final form = ref.watch(createActivityFormProvider);

    final getCurrentLocationUsecase = sl<GetCurrentLocationUsecase>();
    final location =
        await getCurrentLocationUsecase(GetCurrentLocationUsecaseInput());

    /// [event input]
    final input = CreateEventUsecaseInput(
      userId: user.id,
      activities: selectedActivities.map((e) => e.title).toList(),
      inMinutes: form.inHowManyMinutes!,
      forHours: form.forHowManyHours!,
      forAllFriends: form.forAllFriends!,
      lat: location.lat,
      lng: location.lng,
    );

    final createEventOutput = await createEventUsecase(input);

    /// [event id]
    final eventId = createEventOutput.id;

    await cacheEventUsecase(
      CacheCreateEventUsecaseInput(
        user: user,
        id: eventId,
        createEventInput: input,
      ),
    );
  },
);
