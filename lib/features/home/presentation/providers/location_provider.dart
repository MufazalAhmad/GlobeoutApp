import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/activity/domain/usecases/fetch_location.dart';
import 'package:globout/util/di/di.dart';

import '../../domain/models/location_model.dart';

final locationProvider = FutureProvider(
  (ref) async {
    final fetchLocationUsecase = sl<FetchLocationUsecase>();
    final output = await fetchLocationUsecase(FetchLocationUsecaseInput());

    final location = LocationModel(lat: output.lat, lng: output.lng);

    return location;
  },
);
