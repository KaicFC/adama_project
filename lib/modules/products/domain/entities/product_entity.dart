class ProductEntity {
  final int id;
  final String name;
  final String sapCode;
  final String classification;
  final String packing;
  final String imageUrl;
  final String siteUrl;

  ProductEntity({
    required this.id,
    required this.name,
    required this.sapCode,
    required this.classification,
    required this.packing,
    this.imageUrl = '',
    this.siteUrl = '',
  });

  factory ProductEntity.empty() {
    return ProductEntity(
      id: 0,
      name: '',
      sapCode: '',
      classification: '',
      packing: '',
    );
  }

  ProductEntity copyWith({
    int? id,
    String? name,
    String? sapCode,
    String? classification,
    String? packing,
    String? imageUrl,
    String? siteUrl,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      sapCode: sapCode ?? this.sapCode,
      classification: classification ?? this.classification,
      packing: packing ?? this.packing,
      imageUrl: imageUrl ?? this.imageUrl,
      siteUrl: siteUrl ?? this.siteUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductEntity &&
        other.id == id &&
        other.name == name &&
        other.sapCode == sapCode &&
        other.classification == classification &&
        other.packing == packing &&
        other.imageUrl == imageUrl &&
        other.siteUrl == siteUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        sapCode.hashCode ^
        classification.hashCode ^
        packing.hashCode ^
        imageUrl.hashCode ^
        siteUrl.hashCode;
  }
}
