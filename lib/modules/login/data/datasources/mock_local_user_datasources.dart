import 'package:adama_agropacking_flutter_web/modules/login/data/datasources/local_user_datasource_interface.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/models/user_model.dart';

class MockLocalUserDatasource extends ILocalUserDatasource {
  @override
  Future<UserModel?> fetchUser() async {
    return null;
  }

  @override
  Future<bool> removeUser() async {
    return true;
  }

  @override
  Future<bool> storeUser(UserModel user) async {
    return true;
  }
}
