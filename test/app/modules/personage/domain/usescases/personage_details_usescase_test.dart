import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:motivacionow/app/modules/core/helpers/errors/failure.dart';
import 'package:motivacionow/app/modules/personage/domain/entities/personage.dart';
import 'package:motivacionow/app/modules/personage/domain/repositories/personage_details_repository.dart';
import 'package:motivacionow/app/modules/personage/domain/usecases/usecases.dart';

class PersonageDetailsRepositoryMock extends Mock
    implements PersonageDetailsRepository {}

class PersonageDetailsFake extends Fake implements Personage {}

class FailMock extends Mock implements Failure {}

void main() {
  late PersonageDetailsRepositoryMock repository;
  late PersonageDetailsUsecaseImpl usecase;
  late PersonageDetailsFake details;
  late int params;

  setUpAll(() {
    repository = PersonageDetailsRepositoryMock();
    details = PersonageDetailsFake();
    params = faker.randomGenerator.integer(10, min: 1);
    usecase = PersonageDetailsUsecaseImpl(repository: repository);
  });

  test("deve retornar detalhes do personagem", () async {
    when(() => repository.get(id: any(named: "id")))
        .thenAnswer((invocation) async => Right(details));

    final result = await usecase.call(id: params);

    expect(result.isRight(), true);
    expect(result.fold(id, id), details);

    verify(() => repository.get(id: any(named: "id"))).called(1);
  });

  test("deve retornar erro no detalhes do personagem", () async {
    when(() => repository.get(id: any(named: "id")))
        .thenAnswer((invocation) async => Left(FailMock()));

    final result = await usecase.call(id: params);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<Failure>());

    verify(() => repository.get(id: any(named: "id"))).called(1);
  });
}
