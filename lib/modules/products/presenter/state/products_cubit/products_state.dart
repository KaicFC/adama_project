// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:adama_agropacking_flutter_web/modules/products/domain/entities/product_entity.dart';

enum Status { initial, loading, loaded, error }

class ProductsState extends Equatable {
  final Status status;
  final List<ProductEntity> products;

  const ProductsState({
    this.status = Status.initial,
    this.products = const [],
  });

  @override
  List<Object> get props => [status, products];

  ProductsState copyWith({
    Status? status,
    List<ProductEntity>? products,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
