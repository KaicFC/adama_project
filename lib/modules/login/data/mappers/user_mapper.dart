import 'package:adama_agropacking_flutter_web/modules/login/data/models/user_model.dart';
import 'package:adama_agropacking_flutter_web/modules/login/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      name: model.name,
      email: model.email,
      cpf: model.cpf,
      phone: model.phone,
      location: model.location,
      profile: model.profile,
      password: model.password,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      name: entity.name,
      email: entity.email,
      cpf: entity.cpf,
      phone: entity.phone,
      location: entity.location,
      profile: entity.profile,
      password: entity.password,
    );
  }
}
