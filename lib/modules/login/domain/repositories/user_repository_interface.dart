import 'package:adama_agropacking_flutter_web/core/utils/result.dart';
import 'package:adama_agropacking_flutter_web/modules/login/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Result<UserEntity>> signIn({
    required String cpf,
    required String password,
  });

  Future<bool> signOut();
}
