import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../models/user/user.dart';
import '../repository/auth_repository.dart';

class UpdateUserUsecaseInput extends Input {
  final String? name;
  final String id;
  final String? email;
  final String? username;
  final String? image;

  UpdateUserUsecaseInput({
    this.name,
    required this.id,
    this.email,
    this.username,
    this.image,
  });
}

class UpdateUserUsecaseOutput extends Output {
  final User user;

  UpdateUserUsecaseOutput({required this.user});
}

@lazySingleton
class UpdateUserUsecase
    extends Usecase<UpdateUserUsecaseInput, UpdateUserUsecaseOutput> {
  final AuthRepository _authRepository;

  UpdateUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<UpdateUserUsecaseOutput> call(UpdateUserUsecaseInput input) async {
    return await _authRepository.updateUser(input);
  }
}
