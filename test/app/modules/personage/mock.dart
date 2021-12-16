import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:motivacionow/app/modules/core/helpers/errors/failure.dart';
import 'package:motivacionow/app/modules/personage/domain/dtos/dtos.dart';
import 'package:motivacionow/app/modules/personage/domain/entities/entities.dart';
import 'package:motivacionow/app/modules/personage/domain/repositories/repositories.dart';
import 'package:motivacionow/app/modules/personage/infra/datasources/datasources.dart';
import 'package:motivacionow/app/modules/personage/infra/repositories/repositories.dart';

export 'package:dartz/dartz.dart';
export 'package:faker/faker.dart';
export 'package:mocktail/mocktail.dart';

export 'package:motivacionow/app/modules/core/helpers/errors/failure.dart';
export 'package:motivacionow/app/modules/personage/domain/dtos/dtos.dart';
export 'package:motivacionow/app/modules/personage/domain/repositories/repositories.dart';
export 'package:motivacionow/app/modules/personage/domain/usecases/usecases.dart';
export 'package:motivacionow/app/modules/personage/domain/entities/entities.dart';
export 'package:motivacionow/app/modules/personage/infra/datasources/datasources.dart';
export 'package:motivacionow/app/modules/personage/infra/repositories/repositories.dart';

class PersonageDetailsRepositoryMock extends Mock implements PersonageDetailsRepository {}

class PersonageDTOFake extends Fake implements PersonageDTO {}

class PersonageFake extends Fake implements Personage {}

class PersonageRepositoryMock extends Mock implements PersonageRepository {}

class PersonageRemoteDatasourceMock extends Mock implements PersonageRemoteDatasource {}

class FailMock extends Mock implements Failure {}

TypeMatcher<Failure> isFail = isA<Failure>();
