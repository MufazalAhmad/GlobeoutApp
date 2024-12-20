class PermissionModel {
  final String name;
  final String message;
  final bool isMust;
  final bool isGranted;
  final bool isPermanentlyDenied;
  final bool isDenied;

  PermissionModel({
    required this.name,
    required this.isMust,
    required this.isGranted,
    required this.isPermanentlyDenied,
    required this.isDenied,
    required this.message,
  });

  PermissionModel copyWith({
    bool? isGranted,
    bool? isPermanentlyDenied,
    bool? isDenied,
  }) {
    return PermissionModel(
      name: name,
      isMust: isMust,
      message: message,
      isGranted: isGranted ?? this.isGranted,
      isPermanentlyDenied: isPermanentlyDenied ?? this.isPermanentlyDenied,
      isDenied: isDenied ?? this.isDenied,
    );
  }
}
