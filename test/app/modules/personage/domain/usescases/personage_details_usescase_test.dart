import 'package:flutter_test/flutter_test.dart';

import '../../mock.dart';

void main() {
  late PersonageDetailsRepositoryMock repository;
  late PersonageDetailsUsecaseImpl usecase;
  late PersonageFake details;
  late int params;

  setUpAll(() {
    repository = PersonageDetailsRepositoryMock();
    details = PersonageFake();
    params = faker.randomGenerator.integer(10, min: 1);
    usecase = PersonageDetailsUsecaseImpl(repository: repository);
  });

  test("deve retornar detalhes do personagem", () async {
    when(() => repository.get(id: any(named: "id"))).thenAnswer((invocation) async => Right(details));

    final result = await usecase.call(id: params);

    expect(result.isRight(), true);
    expect(result.fold(id, id), details);

    verify(() => repository.get(id: any(named: "id"))).called(1);
  });

  test("deve retornar erro no detalhes do personagem", () async {
    when(() => repository.get(id: any(named: "id"))).thenAnswer((invocation) async => Left(FailMock()));

    final result = await usecase.call(id: params);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isFail);

    verify(() => repository.get(id: any(named: "id"))).called(1);
  });
}
