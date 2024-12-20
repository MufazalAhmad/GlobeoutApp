import 'dart:io';

import 'permission_model.dart';

class PermissionsHolderModel {
  final PermissionModel contacts;
  final PermissionModel location;
  final PermissionModel? backgroundLocation;

  PermissionsHolderModel({
    required this.contacts,
    required this.location,
    this.backgroundLocation,
  });

  PermissionsHolderModel copyWith({
    PermissionModel? contacts,
    PermissionModel? location,
    PermissionModel? backgroundLocation,
  }) {
    return PermissionsHolderModel(
      contacts: contacts ?? this.contacts,
      location: location ?? this.location,
      backgroundLocation: backgroundLocation ?? this.backgroundLocation,
    );
  }

  List<PermissionModel?> get allPermissions {
    final permissions = Platform.isIOS
        ? [contacts, location]
        : [contacts, location, backgroundLocation];
    return permissions;
  }
}
