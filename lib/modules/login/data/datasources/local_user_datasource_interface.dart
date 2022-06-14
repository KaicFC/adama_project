import 'package:adama_agropacking_flutter_web/modules/login/data/models/user_model.dart';

abstract class ILocalUserDatasource {
  Future<UserModel?> fetchUser();

  Future<bool> storeUser(UserModel user);

  Future<bool> removeUser();
}
