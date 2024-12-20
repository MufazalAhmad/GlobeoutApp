import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';
import '../../../../util/exceptions/exceptions.dart';

class GetCurrentLocationUsecaseInput extends Input {
  GetCurrentLocationUsecaseInput();
}

class GetCurrentLocationUsecaseOutput extends Output {
  final double lat;
  final double lng;
  final double alt;

  GetCurrentLocationUsecaseOutput({
    required this.lat,
    required this.lng,
    this.alt = 0.0,
  });
}

@lazySingleton
class GetCurrentLocationUsecase extends Usecase<GetCurrentLocationUsecaseInput,
    GetCurrentLocationUsecaseOutput> {
  bool _serviceEnabled = false;
  bool _permissionEnabled = false;

  @override
  Future<GetCurrentLocationUsecaseOutput> call(
      GetCurrentLocationUsecaseInput input) async {
    _serviceEnabled = await Permission.location.serviceStatus.isEnabled;

    if (!_serviceEnabled) {
      throw const LocationServiceDisabledException();
    }

    _permissionEnabled = await Permission.location.isDenied;

    if (_permissionEnabled) {
      final permissionStatus = await Permission.location.request();

      if (permissionStatus.isDenied) {
        throw LocationPermissionDeniedException(
            message: "Location permission is denied");
      } else if (permissionStatus.isPermanentlyDenied) {
        throw LocationPermissionPermanentlyDeniedException(
            message: "Location permission is permanently denied");
      }
    }

    final position = await Geolocator.getCurrentPosition();

    return GetCurrentLocationUsecaseOutput(
      lat: position.latitude,
      lng: position.longitude,
      alt: position.altitude,
    );
  }
}
