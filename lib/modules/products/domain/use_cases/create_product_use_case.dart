import '../../../../core/utils/result.dart';
import '../entities/product_entity.dart';
import '../repositories/products_repository.dart';

abstract class CreateProductUseCase {
  Future<Result<ProductEntity>> call(ProductEntity product);
}

class CreateProductUseCaseImpl implements CreateProductUseCase {
  final ProductsRepository _repository;

  CreateProductUseCaseImpl({required ProductsRepository repository})
      : _repository = repository;

  @override
  Future<Result<ProductEntity>> call(ProductEntity product) {
    return _repository.createProduct(product);
  }
}
