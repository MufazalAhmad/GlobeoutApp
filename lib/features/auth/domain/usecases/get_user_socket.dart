import 'package:globout/features/auth/data/entities/user/user.dart';
import 'package:globout/features/auth/domain/models/user/user.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class GetUserSocketUsecaseInput extends Input {
  final String id;

  GetUserSocketUsecaseInput({required this.id});
}

class GetUserSocketUsecaseOutput extends Output {
  final Stream<UserEntity> _userEntity;

  GetUserSocketUsecaseOutput({required Stream<UserEntity> data})
      : _userEntity = data;

  Stream<User> get userConnection =>
      _userEntity.map((event) => User.fromEntity(event));
}

@lazySingleton
class GetUserSocketUsecase {
  final AuthRepository _authRepository;

  GetUserSocketUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  GetUserSocketUsecaseOutput call(GetUserSocketUsecaseInput input) {
    return _authRepository.getUserSocket(input);
  }
}
