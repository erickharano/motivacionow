import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:motivacionow/app/modules/core/helpers/errors/failure.dart';
import 'package:motivacionow/app/modules/personage/domain/dtos/personage_dto.dart';
import 'package:motivacionow/app/modules/personage/domain/entities/entities.dart';
import 'package:motivacionow/app/modules/personage/infra/datasources/persosage_remote_datasource.dart';
import 'package:motivacionow/app/modules/personage/infra/repositories/personage_repository_impl.dart';

class PersonageFake extends Fake implements Personage {}

class PersonageDTOFake extends Fake implements PersonageDTO {}

class FailMock extends Mock implements Failure {}

class PersonageRemoteDatasourceMock extends Mock
    implements PersonageRemoteDatasource {}

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
        .thenAnswer((invocation) async => response);

    final result = await repository.getAll(params: params);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<Failure>());

    verify(() => repository.getAll(params: params.toMap())).called(1);
  });
}
