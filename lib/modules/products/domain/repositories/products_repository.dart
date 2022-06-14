import '../../../../core/utils/result.dart';
import '../entities/product_entity.dart';

abstract class ProductsRepository {
  Future<Result<List<ProductEntity>>> getProducts();

  Future<Result<ProductEntity>> createProduct(ProductEntity product);
}
