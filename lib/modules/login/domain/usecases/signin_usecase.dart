import '../../../../core/errors/failure.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/utils/regex.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository_interface.dart';

abstract class SignInUsecase {
  Future<Result<UserEntity>> call({
    required String cpf,
    required String password,
  });
}

class SignInUsecaseImpl extends SignInUsecase {
  final UserRepository repository;

  SignInUsecaseImpl(this.repository);

  @override
  Future<Result<UserEntity>> call({
    required String cpf,
    required String password,
  }) async {
    if (!RegExp(Regex.cpf).hasMatch(cpf)) {
      return Result.failure(Failure(message: 'CPF inválido'));
    }

    if (password.isEmpty || password.length < 4) {
      return Result.failure(Failure(message: 'Senha inválida'));
    }

    return await repository.signIn(
      cpf: cpf,
      password: password,
    );
  }
}
