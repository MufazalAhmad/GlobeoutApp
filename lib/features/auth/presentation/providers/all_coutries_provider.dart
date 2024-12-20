import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/usecases/load_all_coutries.dart';
import 'package:globout/util/di/di.dart';

final allCountriesProvider = FutureProvider((ref) async {
  final loadCountries = sl<LoadAllCoutriesUsecase>();
  final output = await loadCountries(LoadAllCoutriesUsecaseInput());
  return output.countries;
});
