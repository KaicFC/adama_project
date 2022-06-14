import 'package:adama_agropacking_flutter_web/modules/products/domain/entities/product_entity.dart';
import 'package:adama_agropacking_flutter_web/modules/products/domain/use_cases/create_product_use_case.dart';
import 'package:adama_agropacking_flutter_web/modules/products/presenter/state/create_product_cubit/create_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SaveFunction = ProductEntity Function(
  ProductEntity entity,
);

class CreateProductCubit extends Cubit<CreateProductState> {
  final CreateProductUseCase _createProduct;

  CreateProductCubit({required CreateProductUseCase createProduct})
      : _createProduct = createProduct,
        super(CreateProductState());

  Future<void> createProduct() async {
    emit(state.copyWith(status: CreateProductStatus.loading));

    final result = await _createProduct(state.data);

    result.when(
      success: (user) {
        emit(state.copyWith(status: CreateProductStatus.success));
      },
      failure: (failure) {
        emit(state.copyWith(
          status: CreateProductStatus.failure,
          error: failure.message,
        ));
      },
    );
  }

  void save(SaveFunction saveFunction) {
    emit(state.copyWith(productData: saveFunction(state.data)));
  }
}
