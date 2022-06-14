import 'package:adama_agropacking_flutter_web/core/datasource/http/custom_dio_datasource.dart';
import 'package:adama_agropacking_flutter_web/core/services/injection/dependency_injection_service.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/datasources/local_user_datasource_interface.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/datasources/mock_local_user_datasources.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/datasources/mock_remote_user_datasource.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/datasources/remote_user_datasource_interface.dart';
import 'package:adama_agropacking_flutter_web/modules/login/data/repositories/user_repository_impl.dart';
import 'package:adama_agropacking_flutter_web/modules/login/domain/repositories/user_repository_interface.dart';

import 'package:adama_agropacking_flutter_web/modules/login/domain/usecases/signin_usecase.dart';
import 'package:adama_agropacking_flutter_web/modules/login/domain/usecases/signout_usecase.dart';

class UserModule {
  static void initDependencies() {
    Dependency.register<CustomDioDatasource>(CustomDioDatasource.getInstance());

    Dependency.register<IRemoteUserDatasource>(MockRemoteUserDatasouce(
        customDio: Dependency.get<CustomDioDatasource>()));

    Dependency.register<ILocalUserDatasource>(MockLocalUserDatasource());

    Dependency.register<UserRepository>(UserRepositoryImpl(
      remoteUserDatasource: Dependency.get<IRemoteUserDatasource>(),
      localUserDatasource: Dependency.get<ILocalUserDatasource>(),
    ));
    Dependency.register<SignInUsecase>(SignInUsecaseImpl(
      Dependency.get<UserRepository>(),
    ));

    Dependency.register<SignOutUsecase>(SignOutUsecaseImpl(
      Dependency.get<UserRepository>(),
    ));
  }
}
