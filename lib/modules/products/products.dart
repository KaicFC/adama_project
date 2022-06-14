import 'package:adama_agropacking_flutter_web/modules/products/data/repositories/product_repository_impl.dart';
import 'package:adama_agropacking_flutter_web/modules/products/domain/repositories/products_repository.dart';
import 'package:adama_agropacking_flutter_web/modules/products/domain/use_cases/create_product_use_case.dart';
import 'package:adama_agropacking_flutter_web/modules/products/domain/use_cases/get_products_use_case.dart';

import '../../core/services/injection/dependency_injection_service.dart';

class ProductsModule {
  static void initDependencies() {
    Dependency.register<ProductsRepository>(ProductsRepositoryImpl());
    Dependency.register<GetProductsUseCase>(GetProductsUseCaseImpl(
        repository: Dependency.get<ProductsRepository>()));
    Dependency.register<CreateProductUseCase>(CreateProductUseCaseImpl(
        repository: Dependency.get<ProductsRepository>()));
  }
}
