import 'package:flutter_test/flutter_test.dart';

import '../../mock.dart';

void main() {
  late PersonageRepositoryMock repository;
  late PersonageUsecaseImpl usecase;
  late List<Personage> response;
  late PersonageDTOFake params;

  setUpAll(() {
    repository = PersonageRepositoryMock();
    usecase = PersonageUsecaseImpl(repository: repository);
    response = List.generate(10, (index) => PersonageFake()).toList();
    params = PersonageDTOFake();
  });

  test("deve retornar um caso de sucesso", () async {
    when(() => repository.getAll(params: params))
        .thenAnswer((invocation) async => Right(response));

    final result = await usecase.call(params: params);

    expect(result.isRight(), true);
    expect(result.fold(id, id), response);

    verify(() => repository.getAll(params: params)).called(1);
  });

  test("deve retornar um caso de erro", () async {
    when(() => repository.getAll(params: params))
        .thenAnswer((invocation) async => Left(FailMock()));

    final result = await usecase.call(params: params);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isFail);

    verify(() => repository.getAll(params: params)).called(1);
  });
}
