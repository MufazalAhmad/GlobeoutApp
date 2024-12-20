////********** START IMPORTS **********////
import '../../../../infrastructure/repository.dart';
import '../usecases/create_report.dart';
////********** END IMPORTS **********////

abstract class SettingsRepository extends Repository {
////********** START METHODS **********////
  /// [CreateReportUsecaseInput] is received to [createReport] method as parameter
  /// [CreateReportUsecaseOutput] is returned from [createReport] method
  Future<CreateReportUsecaseOutput> createReport(CreateReportUsecaseInput input);
    
////********** END METHODS **********////
}
  