class ProductDTO {
  final int page;
  final int perPage;

  const ProductDTO({
    this.page = 1,
    this.perPage = 10,
  });

  ProductDTO copyWith({
    int? page,
    int? perPage,
  }) {
    return ProductDTO(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'perPage': perPage,
    };
  }
}
