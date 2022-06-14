import '../repositories/user_repository_interface.dart';

abstract class SignOutUsecase {
  Future<bool> call();
}

class SignOutUsecaseImpl extends SignOutUsecase {
  final UserRepository repository;

  SignOutUsecaseImpl(this.repository);

  @override
  Future<bool> call() async {
    return await repository.signOut();
  }
}
