import '../../../../core/utils/result.dart';
import '../entities/product_entity.dart';
import '../repositories/products_repository.dart';

abstract class GetProductsUseCase {
  Future<Result<List<ProductEntity>>> call();
}

class GetProductsUseCaseImpl implements GetProductsUseCase {
  final ProductsRepository _repository;

  GetProductsUseCaseImpl({required ProductsRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<ProductEntity>>> call() {
    return _repository.getProducts();
  }
}
