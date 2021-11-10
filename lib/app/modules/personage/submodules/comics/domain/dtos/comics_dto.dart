class ComicsDTO {
  final int page;
  final int perPage;

  ComicsDTO({
    required this.page,
    required this.perPage,
  });

  ComicsDTO copyWith({
    int? page,
    int? perPage,
  }) {
    return ComicsDTO(
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
