////********** AUTOGENERATED FILE: DO NOT REMOVE ANY COMMENT IN THIS STYLE **********////
////********** START IMPORTS **********////
import '../../../../infrastructure/repository.dart';
import '../usecases/send_otp.dart';
import '../usecases/verify_otp.dart';
import '../usecases/get_user.dart';
import '../usecases/update_user.dart';
import '../usecases/save_auth.dart';
import '../usecases/remove_auth.dart';
import '../usecases/check_auth.dart';
import '../usecases/load_all_coutries.dart';
import '../usecases/switch_user_visibility.dart';
import '../usecases/get_user_socket.dart';
////********** END IMPORTS **********////

abstract class AuthRepository extends Repository {
////********** START METHODS **********////
  /// [SendOtpUsecaseInput] is received to [sendOtp] method as parameter
  /// [SendOtpUsecaseOutput] is returned from [sendOtp] method
  Future<SendOtpUsecaseOutput> sendOtp(SendOtpUsecaseInput input);

  /// [VerifyOtpUsecaseInput] is received to [verifyOtp] method as parameter
  /// [VerifyOtpUsecaseOutput] is returned from [verifyOtp] method
  Future<VerifyOtpUsecaseOutput> verifyOtp(VerifyOtpUsecaseInput input);

  /// [GetUserUsecaseInput] is received to [getUser] method as parameter
  /// [GetUserUsecaseOutput] is returned from [getUser] method
  Future<GetUserUsecaseOutput> getUser(GetUserUsecaseInput input);

  /// [UpdateUserUsecaseInput] is received to [updateUser] method as parameter
  /// [UpdateUserUsecaseOutput] is returned from [updateUser] method
  Future<UpdateUserUsecaseOutput> updateUser(UpdateUserUsecaseInput input);

  /// [SaveAuthUsecaseInput] is received to [saveAuth] method as parameter
  /// [SaveAuthUsecaseOutput] is returned from [saveAuth] method
  Future<SaveAuthUsecaseOutput> saveAuth(SaveAuthUsecaseInput input);

  /// [RemoveAuthUsecaseInput] is received to [removeAuth] method as parameter
  /// [RemoveAuthUsecaseOutput] is returned from [removeAuth] method
  Future<RemoveAuthUsecaseOutput> removeAuth(RemoveAuthUsecaseInput input);

  /// [CheckAuthUsecaseInput] is received to [checkAuth] method as parameter
  /// [CheckAuthUsecaseOutput] is returned from [checkAuth] method
  Future<CheckAuthUsecaseOutput> checkAuth(CheckAuthUsecaseInput input);

  /// [LoadAllCoutriesUsecaseInput] is received to [loadAllCoutries] method as parameter
  /// [LoadAllCoutriesUsecaseOutput] is returned from [loadAllCoutries] method
  Future<LoadAllCoutriesUsecaseOutput> loadAllCoutries(
      LoadAllCoutriesUsecaseInput input);

  /// [SwitchUserVisibilityUsecaseInput] is received to [switchUserVisibility] method as parameter
  /// [SwitchUserVisibilityUsecaseOutput] is returned from [switchUserVisibility] method
  Future<SwitchUserVisibilityUsecaseOutput> switchUserVisibility(
      SwitchUserVisibilityUsecaseInput input);

  /// [GetUserSocketUsecaseInput] is received to [getUserSocket] method as parameter
  /// [GetUserSocketUsecaseOutput] is returned from [getUserSocket] method
  GetUserSocketUsecaseOutput getUserSocket(GetUserSocketUsecaseInput input);

////********** END METHODS **********////
}
