import 'package:adama_agropacking_flutter_web/core/errors/exception.dart';
import 'package:adama_agropacking_flutter_web/core/errors/failure.dart';
import 'package:adama_agropacking_flutter_web/core/utils/result.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/datasources/local_user_datasource_interface.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/datasources/remote_user_datasource_interface.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/mappers/user_mapper.dart';
import 'package:adama_agropacking_flutter_web/modules/login/domain/entities/user_entity.dart';
import 'package:adama_agropacking_flutter_web/modules/login/domain/repositories/user_repository_interface.dart';

class UserRepositoryImpl extends UserRepository {
  final IRemoteUserDatasource remoteUserDatasource;
  final ILocalUserDatasource localUserDatasource;

  UserRepositoryImpl({
    required this.remoteUserDatasource,
    required this.localUserDatasource,
  });

  @override
  Future<Result<UserEntity>> signIn({
    required String cpf,
    required String password,
  }) async {
    try {
      final user = await remoteUserDatasource.signIn(
        cpf: cpf,
        password: password,
      );
      await localUserDatasource.storeUser(user);
      return Result.success(UserMapper.toEntity(user));
    } on ApiException catch (e) {
      return Result.failure(Failure(message: e.msg));
    } catch (e) {
      return Result.failure(Failure(message: 'Erro desconhecido'));
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      final result = await remoteUserDatasource.signOut();
      if (result) await localUserDatasource.removeUser();
      return result;
    } on Exception catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }
}
