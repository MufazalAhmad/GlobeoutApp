////********** AUTOGENERATED FILE: DO NOT REMOVE ANY COMMENT IN THIS STYLE **********////
////********** START IMPORTS **********////
import '../../../../../infrastructure/datasource.dart';
import '../../../domain/usecases/save_auth.dart';
import '../../../domain/usecases/remove_auth.dart';
import '../../../domain/usecases/check_auth.dart';
////********** END IMPORTS **********////

abstract class AuthLocalDataSource extends DataSource {
  ////********** START METHODS **********////
  /// [SaveAuthUsecaseInput] is received to [saveAuth] method as parameter
  /// [SaveAuthUsecaseOutput] is returned from [saveAuth] method
  Future<SaveAuthUsecaseOutput> saveAuth(SaveAuthUsecaseInput input);


  /// [RemoveAuthUsecaseInput] is received to [removeAuth] method as parameter
  /// [RemoveAuthUsecaseOutput] is returned from [removeAuth] method
  Future<RemoveAuthUsecaseOutput> removeAuth(RemoveAuthUsecaseInput input);


  /// [CheckAuthUsecaseInput] is received to [checkAuth] method as parameter
  /// [CheckAuthUsecaseOutput] is returned from [checkAuth] method
  Future<CheckAuthUsecaseOutput> checkAuth(CheckAuthUsecaseInput input);

////********** END METHODS **********////
}
  
