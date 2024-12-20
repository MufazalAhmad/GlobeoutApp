import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:globout/features/auth/data/entities/country/country_entity.dart';
import 'package:globout/features/auth/data/source/assets/auth_assets_datasource.dart';
import 'package:globout/features/auth/domain/models/country/country.dart';
import 'package:globout/features/auth/domain/usecases/load_all_coutries.dart';
import 'package:injectable/injectable.dart';

import '../../../../../util/resource/r.dart';

@LazySingleton(as: AuthAssetsDataSource)
class AuthAssetsDataSourceImp implements AuthAssetsDataSource {
  @override
  Future<LoadAllCoutriesUsecaseOutput> loadAllCoutries(
      LoadAllCoutriesUsecaseInput input) async {
    final countryData = await rootBundle.loadString(R.jsons.COUNTRIES);
    final listOfJsonObjects =
        List<Map<String, dynamic>>.from(json.decode(countryData));
    final countries = listOfJsonObjects
        .map((jsonObject) => CountryEntity.fromJson(jsonObject))
        .toList();
    return LoadAllCoutriesUsecaseOutput(
      countries: countries.map((e) => Country.fromEntity(e)).toList(),
    );
  }
}
