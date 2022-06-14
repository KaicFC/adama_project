import 'package:adama_agropacking_flutter_web/modules/products/domain/use_cases/get_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required GetProductsUseCase getProductsUseCase})
      : _getProductsUseCase = getProductsUseCase,
        super(const ProductsState());

  final GetProductsUseCase _getProductsUseCase;

  getProducts() async {
    emit(state.copyWith(status: Status.loading));

    final result = await _getProductsUseCase();

    result.when(
      success: (products) =>
          emit(state.copyWith(status: Status.loaded, products: products)),
      failure: (failure) => emit(state.copyWith(status: Status.error)),
    );
  }
}
