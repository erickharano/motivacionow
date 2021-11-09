class PersonageDTO {
  final int page;
  final int perPage;

  PersonageDTO({
    required this.page,
    required this.perPage,
  });

  PersonageDTO copyWith({
    int? page,
    int? perPage,
  }) {
    return PersonageDTO(
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
