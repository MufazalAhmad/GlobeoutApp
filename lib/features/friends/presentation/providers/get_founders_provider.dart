import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/friends/domain/models/founder/founder.dart';
import 'package:globout/features/friends/domain/usecases/get_founders_usecase.dart';
import 'package:globout/util/di/di.dart';

final getFoundersProvider = FutureProvider<List<Founder>>(
  (ref) async {
    final getFounders = sl<GetFoundersUsecaseUsecase>();
    final output = await getFounders(GetFoundersUsecaseUsecaseInput());
    return output.founders;
  },
);
