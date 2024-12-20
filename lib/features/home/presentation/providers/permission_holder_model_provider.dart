import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/home/domain/models/permission_holder_model.dart';
import 'package:globout/features/home/domain/models/permission_model.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHolderModelNotifier
    extends StateNotifier<PermissionsHolderModel?> {
  PermissionHolderModelNotifier() : super(null);

  void updatePermissionModel(PermissionsHolderModel permissionHolder) {
    state = permissionHolder;
  }

  Future<void> init() async {
    /// [Check Permissions]
    final isContactsGrated = await Permission.contacts.isGranted;

    /// [Model the permissions]
    /// [CONTACTS]
    final contactsPermission = PermissionModel(
        name: "Contacts",
        isMust: true,
        isGranted: isContactsGrated,
        isPermanentlyDenied: isContactsGrated
            ? false
            : await Permission.contacts.isPermanentlyDenied,
        isDenied: isContactsGrated ? false : await Permission.contacts.isDenied,
        message:
            "Globout needs your Contacts permission to suggest your friends.");

    /// [LOCATION]
    final isLocationGranted = await Permission.location.isGranted;
    final locationPermission = PermissionModel(
      name: "Location",
      isMust: true,
      isGranted: isLocationGranted,
      isPermanentlyDenied: isLocationGranted
          ? false
          : await Permission.location.isPermanentlyDenied,
      isDenied: isLocationGranted ? false : await Permission.location.isDenied,
      message:
          'Globout needs your Location permission to show your friends activities near you.',
    );

    if (Platform.isIOS) {
      /// [Update the state]
      state = PermissionsHolderModel(
        contacts: contactsPermission,
        location: locationPermission,
      );
    } else {
      /// [BACKGROUND LOCATION]
      final isBackgroundLocationGranted = await Permission.location.isGranted;
      final backgroundLocationPermission = PermissionModel(
        name: "Background Location",
        isMust: false,
        isGranted: isBackgroundLocationGranted,
        isPermanentlyDenied: isBackgroundLocationGranted
            ? false
            : await Permission.locationAlways.isPermanentlyDenied,
        isDenied: isBackgroundLocationGranted
            ? false
            : await Permission.locationAlways.isDenied,
        message:
            'Globout needs your background location to keep you sync with your activities on map.',
      );

      /// [Update the state]
      state = PermissionsHolderModel(
        contacts: contactsPermission,
        location: locationPermission,
        backgroundLocation: backgroundLocationPermission,
      );
    }
  }

  Future<void> request(PermissionModel permission) async {
    /// [Request Contacts Permissions]
    if (permission.name == "Contacts") {
      final permissions = await Permission.contacts.request();

      /// [Check Permissions]
      final isContactsGrated = permissions.isGranted;

      /// [Update the state]
      state = state!.copyWith(
        contacts: state!.contacts.copyWith(isGranted: isContactsGrated),
      );
    } else if (permission.name == "Location") {
      final permissions = await Permission.location.request();

      /// [Check Permissions]
      final isLocationGranted = permissions.isGranted;

      /// [Update the state]
      state = state!.copyWith(
        location: state!.location.copyWith(isGranted: isLocationGranted),
      );
    } else if (permission.name == "Background Location") {
      final permissions = await Permission.locationAlways.request();

      /// [Check Permissions]
      final isLocationGranted = permissions.isGranted;

      /// [Update the state]
      state = state!.copyWith(
        backgroundLocation:
            state!.backgroundLocation?.copyWith(isGranted: isLocationGranted),
      );
    }
  }

  bool get allMustPermissionsGranted {
    return !state!.allPermissions
        .where((element) => element?.isMust ?? false)
        .toList()
        .any((element) => !(element?.isGranted ?? false));
  }

  PermissionsHolderModel? get permissions => state;
}

final permissionModelProvider = StateNotifierProvider<
    PermissionHolderModelNotifier, PermissionsHolderModel?>(
  (ref) => PermissionHolderModelNotifier(),
);
