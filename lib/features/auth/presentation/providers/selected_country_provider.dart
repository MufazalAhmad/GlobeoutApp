import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/models/country/country.dart';
import 'package:globout/features/auth/presentation/providers/all_coutries_provider.dart';

class SelectedCountryNotifier extends StateNotifier<Country?> {
  SelectedCountryNotifier() : super(null);

  void setCountry(Country country) {
    state = country;
  }

  Country? get country => state;
}

final selectedCountryProvider =
    StateNotifierProvider<SelectedCountryNotifier, Country?>((ref) {
  final notifier = SelectedCountryNotifier();
  final countries = ref.watch(allCountriesProvider);

  if (countries.hasValue && notifier.country == null) {
    notifier.setCountry(
      countries.asData!.value.firstWhere((element) => element.code == "+41"),
    );
  }

  return notifier;
});
