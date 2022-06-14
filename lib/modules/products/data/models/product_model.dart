// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String sapCode;
  final String classification;
  final String packing;

  ProductModel({
    required this.id,
    required this.name,
    required this.sapCode,
    required this.classification,
    required this.packing,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? sapCode,
    String? classification,
    String? packing,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      sapCode: sapCode ?? this.sapCode,
      classification: classification ?? this.classification,
      packing: packing ?? this.packing,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sapCode': sapCode,
      'classification': classification,
      'packing': packing,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      sapCode: map['sapCode'] as String,
      classification: map['classification'] as String,
      packing: map['packing'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.sapCode == sapCode &&
        other.classification == classification &&
        other.packing == packing;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        sapCode.hashCode ^
        classification.hashCode ^
        packing.hashCode;
  }
}
