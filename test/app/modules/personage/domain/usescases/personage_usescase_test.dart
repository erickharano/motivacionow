import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:motivacionow/app/modules/core/helpers/errors/failure.dart';
import 'package:motivacionow/app/modules/personage/domain/dtos/personage_dto.dart';
import 'package:motivacionow/app/modules/personage/domain/entities/entities.dart';

import 'package:motivacionow/app/modules/personage/domain/repositories/personage_repository.dart';
import 'package:motivacionow/app/modules/personage/domain/usecases/usecases.dart';

class PersonageRepositoryMock extends Mock implements PersonageRepository {}

class PersonageFake extends Fake implements Personage {}

class PersonageDTOFake extends Fake implements PersonageDTO {}

class FailMock extends Mock implements Failure {}

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
    expect(result.fold(id, id), isA<Failure>());

    verify(() => repository.getAll(params: params)).called(1);
  });
}
