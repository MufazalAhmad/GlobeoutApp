////********** START IMPORTS **********////
import '../../../../../infrastructure/datasource.dart';
import '../../../domain/usecases/create_report.dart';
////********** END IMPORTS **********////

abstract class SettingsFirebaseDataSource extends DataSource {
  ////********** START METHODS **********////
  /// [CreateReportUsecaseInput] is received to [createReport] method as parameter
  /// [CreateReportUsecaseOutput] is returned from [createReport] method
  Future<CreateReportUsecaseOutput> createReport(CreateReportUsecaseInput input);

////********** END METHODS **********////
}
  