import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';
import '../repository/settings_repository.dart';

class CreateReportUsecaseInput extends Input {
  CreateReportUsecaseInput({
    required this.userId,
    required this.description,
  });

  final String userId;
  final String description;
}

class CreateReportUsecaseOutput extends Output {
  CreateReportUsecaseOutput();
}

@lazySingleton
class CreateReportUsecase
    extends Usecase<CreateReportUsecaseInput, CreateReportUsecaseOutput> {
  final SettingsRepository _settingsRepository;

  CreateReportUsecase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  @override
  Future<CreateReportUsecaseOutput> call(CreateReportUsecaseInput input) async {
    return await _settingsRepository.createReport(input);
  }
}
