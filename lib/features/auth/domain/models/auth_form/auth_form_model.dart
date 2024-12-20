class AuthFormModel {
  final String? phNumber;
  final String? name;
  final String? image;
  final String? username;
  final String? email;

  AuthFormModel({
    this.phNumber,
    this.name,
    this.image,
    this.email,
    this.username,
  });

  AuthFormModel copyWith(
      {String? phNumber,
      String? name,
      String? image,
      String? email,
      String? username,
      s}) {
    return AuthFormModel(
      phNumber: phNumber ?? this.phNumber,
      name: name ?? this.name,
      image: image ?? this.image,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }
}
