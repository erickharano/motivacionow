import 'package:flutter_test/flutter_test.dart';
import 'package:core/core.dart';

import 'package:marvel/app/modules/personage/domain/dtos/dtos.dart';
import 'package:marvel/app/modules/personage/domain/entities/entities.dart';
import 'package:marvel/app/modules/personage/domain/repositories/repositories.dart';
import 'package:marvel/app/modules/personage/domain/usecases/personage_usecase.dart';
import 'package:marvel/app/modules/personage/infra/datasources/datasources.dart';
import 'package:mocktail/mocktail.dart';

export 'package:dartz/dartz.dart';
export 'package:faker/faker.dart';
export 'package:mocktail/mocktail.dart';

export 'package:marvel/app/modules/personage/domain/dtos/dtos.dart';
export 'package:marvel/app/modules/personage/domain/repositories/repositories.dart';
export 'package:marvel/app/modules/personage/domain/usecases/usecases.dart';
export 'package:marvel/app/modules/personage/domain/entities/entities.dart';
export 'package:marvel/app/modules/personage/infra/datasources/datasources.dart';
export 'package:marvel/app/modules/personage/infra/repositories/repositories.dart';
export 'package:marvel/app/modules/personage/external/datasources/personage_remote_datasource_impl.dart';
export 'package:marvel/app/modules/personage/external/helpers/errors/personage_mapper_error.dart';
export 'package:marvel/app/modules/personage/external/mappers/personage_mapper.dart';
export 'package:marvel/app/modules/personage/domain/usecases/personage_usecase.dart';

class PersonageDetailsRepositoryMock extends Mock implements PersonageDetailsRepository {}

class PersonageDTOFake extends Fake implements PersonageDTO {}

class PersonageFake extends Fake implements Personage {}

class PersonageRepositoryMock extends Mock implements PersonageRepository {}

class PersonageUsecaseMock extends Mock implements PersonageUsecase {}

class PersonageRemoteDatasourceMock extends Mock implements PersonageRemoteDatasource {}

class HttpClientAdapterMock extends Mock implements HttpClientAdapter {}

class FailMock extends Mock implements Failure {}

TypeMatcher<Failure> isFail = isA<Failure>();
