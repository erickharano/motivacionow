class PersonageDTO {
  final int offset;
  final int limit;

  PersonageDTO({
    required this.offset,
    required this.limit,
  });

  PersonageDTO copyWith({
    int? offset,
    int? limit,
  }) {
    return PersonageDTO(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'limit': limit,
    };
  }
}
