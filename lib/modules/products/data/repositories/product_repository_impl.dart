import '../../../../core/utils/result.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<Result<List<ProductEntity>>> getProducts() {
    final products = List.generate(
      30,
      (index) => ProductEntity(
        id: index,
        name: 'Produto $index',
        sapCode: 'Código SAP $index',
        classification: 'Classificação $index',
        packing: 'Packing $index',
      ),
    );

    return Future.delayed(
        const Duration(seconds: 2), () => Result.success(products));
  }

  @override
  Future<Result<ProductEntity>> createProduct(ProductEntity product) {
    return Future.delayed(
        const Duration(seconds: 2), () => Result.success(product));
  }
}
