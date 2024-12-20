import 'package:geolocator/geolocator.dart';
import 'package:globout/util/exceptions/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

class FetchLocationUsecaseInput extends Input {
  FetchLocationUsecaseInput();
}

class FetchLocationUsecaseOutput extends Output {
  final double lat;
  final double lng;
  final double alt;

  FetchLocationUsecaseOutput({
    required this.lat,
    required this.lng,
    this.alt = 0.0,
  });
}

@lazySingleton
class FetchLocationUsecase
    extends Usecase<FetchLocationUsecaseInput, FetchLocationUsecaseOutput> {
  bool _serviceEnabled = false;
  bool _permissionEnabled = false;

  @override
  Future<FetchLocationUsecaseOutput> call(Input input) async {
    _serviceEnabled = await Permission.location.serviceStatus.isEnabled;
    if (!_serviceEnabled) {
      throw const LocationServiceDisabledException();
    }

    _permissionEnabled = await Permission.location.isGranted;
    if (!_permissionEnabled) {
      throw LocationPermissionDeniedException(
          message: "Location permission is denied");
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    final position = await Geolocator.getCurrentPosition();

    return FetchLocationUsecaseOutput(
      lat: position.latitude ?? 0.0,
      lng: position.longitude ?? 0.0,
      alt: position.altitude ?? 0.0,
    );
  }
}
