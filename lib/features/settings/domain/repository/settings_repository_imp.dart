////********** START IMPORTS **********////
import 'settings_repository.dart';
import 'package:injectable/injectable.dart';
import '../../data/source/firebase/settings_firebase_datasource.dart';
import '../usecases/create_report.dart';
////********** END IMPORTS **********////

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImp implements SettingsRepository {
////********** START VARIABLES **********////
  final SettingsFirebaseDataSource _settingsFirebaseDataSource;
////********** END VARIABLES **********////

SettingsRepositoryImp({
////********** START RECEIVE VALUES **********////
    required SettingsFirebaseDataSource settingsFirebaseDataSource,
////********** END RECEIVE VALUES **********////
  })  :
////********** START SET VALUES **********////
        _settingsFirebaseDataSource = settingsFirebaseDataSource
////********** END SET VALUES **********////
  ;
    
////********** START METHODS **********////
  /// [CreateReportUsecaseInput] is received to [createReport] method as parameter
  /// [CreateReportUsecaseOutput] is returned from [createReport] method
  @override
  Future<CreateReportUsecaseOutput> createReport(CreateReportUsecaseInput input) async {
    return _settingsFirebaseDataSource.createReport(input);
  }
  
////********** END METHODS **********////
}
  