import 'package:flutter_test/flutter_test.dart';

import '../../mock.dart';

void main() {
  late PersonageRepositoryImpl repository;
  late List<Personage> response;
  late PersonageDTO params;
  late PersonageRemoteDatasourceMock datasource;

  setUpAll(() {
    datasource = PersonageRemoteDatasourceMock();
    repository = PersonageRepositoryImpl(datasource: datasource);
    response = List.generate(10, (index) => PersonageFake()).toList();
    params = PersonageDTO(offset: 0, limit: 20);
  });

  test("deve retornar um caso de sucesso", () async {
    when(() => datasource.getAll(queries: params.toMap()))
        .thenAnswer((invocation) async => response);

    final result = await repository.getAll(params: params);

    expect(result.isRight(), true);
    expect(result.fold(id, id), response);

    verify(() => datasource.getAll(queries: params.toMap())).called(1);
  });

  test("deve retornar um caso de erro", () async {
    when(() => datasource.getAll(queries: params.toMap()))
        .thenThrow(FailMock());

    final result = await repository.getAll(params: params);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<Failure>());

    verify(() => datasource.getAll(queries: params.toMap())).called(1);
  });
}
