import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';
import '../../../../main/main_dev.dart';

class InitBackgroundIsolatesUsecaseInput extends Input {
  InitBackgroundIsolatesUsecaseInput();
}

class InitBackgroundIsolatesUsecaseOutput extends Output {
  InitBackgroundIsolatesUsecaseOutput();
}

@lazySingleton
class InitBackgroundIsolatesUsecase extends Usecase<
    InitBackgroundIsolatesUsecaseInput, InitBackgroundIsolatesUsecaseOutput> {
  @override
  Future<InitBackgroundIsolatesUsecaseOutput> call(
      InitBackgroundIsolatesUsecaseInput input) async {
    await initBackgroundLocationService();
    return InitBackgroundIsolatesUsecaseOutput();
  }

  /// [init service]
  Future<void> initBackgroundLocationService() async {
    final service = FlutterBackgroundService();

    var isRunning = await service.isRunning();
    if (isRunning) {
      return;
    }

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        /// [ this will be executed when app is in foreground or background in separated isolate]
        onStart: onStart,

        // auto start service
        autoStart: true,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(
        /// [Auto start service]
        autoStart: true,

        /// [this will be executed when app is in foreground in separated isolate]
        onForeground: onStart,

        /// [you have to enable background fetch capability on xcode project]
        onBackground: onIosBackground,
      ),
    );

    service.startService();
  }
}
