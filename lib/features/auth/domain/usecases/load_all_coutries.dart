import 'package:globout/features/auth/domain/models/country/country.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class LoadAllCoutriesUsecaseInput extends Input {
  LoadAllCoutriesUsecaseInput();
}

class LoadAllCoutriesUsecaseOutput extends Output {
  final List<Country> countries;

  LoadAllCoutriesUsecaseOutput({
    required this.countries,
  });
}

@lazySingleton
class LoadAllCoutriesUsecase
    extends Usecase<LoadAllCoutriesUsecaseInput, LoadAllCoutriesUsecaseOutput> {
  final AuthRepository _authRepository;

  LoadAllCoutriesUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<LoadAllCoutriesUsecaseOutput> call(
      LoadAllCoutriesUsecaseInput input) async {
    return await _authRepository.loadAllCoutries(input);
  }
}
