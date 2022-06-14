import 'package:adama_agropacking_flutter_web/modules/products/domain/entities/product_entity.dart';

import '../models/product_model.dart';

class ProductMapper {
  static ProductEntity toEntity(ProductModel model) {
    return ProductEntity(
      id: model.id,
      name: model.name,
      sapCode: model.sapCode,
      classification: model.classification,
      packing: model.packing,
    );
  }

  static ProductModel toModel(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      sapCode: entity.sapCode,
      classification: entity.classification,
      packing: entity.packing,
    );
  }
}
