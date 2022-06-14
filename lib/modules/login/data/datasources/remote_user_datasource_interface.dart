import 'package:adama_agropacking_flutter_web/modules/login/data/models/user_model.dart';

abstract class IRemoteUserDatasource {
  Future<UserModel> createAccount(UserModel user);

  Future<UserModel> signIn({
    required String cpf,
    required String password,
  });

  Future<UserModel> recoverPassword({
    required String cpf,
  });

  Future<bool> signOut();
}
