import 'package:equatable/equatable.dart';

import '../../../domain/entities/product_entity.dart';

enum CreateProductStatus { initial, loading, success, failure }

class CreateProductState extends Equatable {
  final ProductEntity data;
  final String error;
  final CreateProductStatus status;

  CreateProductState({
    ProductEntity? productData,
    this.error = '',
    this.status = CreateProductStatus.initial,
  }) : data = productData ?? ProductEntity.empty();

  CreateProductState copyWith({
    ProductEntity? productData,
    String? error,
    CreateProductStatus? status,
  }) {
    return CreateProductState(
      productData: productData ?? data,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, error, data];
}
