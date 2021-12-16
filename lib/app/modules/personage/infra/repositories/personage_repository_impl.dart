import 'package:dartz/dartz.dart';

import '../../../core/helpers/errors/errors.dart';
import '../../domain/repositories/personage_repository.dart';
import '../../domain/dtos/personage_dto.dart';
import '../../domain/entities/personage.dart';
import '../datasources/personage_remote_datasource.dart';

class PersonageRepositoryImpl implements PersonageRepository {
  final PersonageRemoteDatasource datasource;

  PersonageRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<Personage>>> getAll({
    required PersonageDTO params,
  }) async {
    try {
      final response = await datasource.getAll(queries: params.toMap());
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
