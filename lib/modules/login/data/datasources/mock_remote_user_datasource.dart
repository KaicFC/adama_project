import 'package:adama_agropacking_flutter_web/core/datasource/http/custom_dio_datasource.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/datasources/remote_user_datasource_interface.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/models/user_model.dart';

class MockRemoteUserDatasouce extends IRemoteUserDatasource {
  final CustomDioDatasource customDio;

  MockRemoteUserDatasouce({required this.customDio});

  final _user = const UserModel(
    name: 'John Doe',
    email: 'johndoe@gmai.com',
    cpf: '02676195107',
    phone: '55329982009811',
    profile: '',
    location: 'São Paulo, SP',
  );

  @override
  Future<UserModel> createAccount(UserModel user) async {
    await Future.delayed(const Duration(seconds: 2));
    return _user;
  }

  @override
  Future<UserModel> recoverPassword({required String cpf}) async {
    await Future.delayed(const Duration(seconds: 2));
    return _user;
  }

  @override
  Future<UserModel> signIn(
      {required String cpf, required String password}) async {
    final uri = Uri.parse(
        'https://run.mocky.io/v3/87230d7e-3a68-4e66-8c5f-68fbe1d874b1');

    final response = await customDio.instance.get('$uri');
    final res = await response.data;
    
    return UserModel.fromMap(res);
  }

  @override
  Future<bool> signOut() async {
    return true;
  }
}
