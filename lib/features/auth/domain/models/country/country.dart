import 'package:globout/features/auth/data/entities/country/country_entity.dart';

class Country {
  final String name;
  final String flag;
  final String code;

  Country({
    required this.name,
    required this.flag,
    required this.code,
  });

  factory Country.fromEntity(CountryEntity entity) {
    return Country(
      name: entity.name,
      flag: entity.flag,
      code: entity.code,
    );
  }
}
