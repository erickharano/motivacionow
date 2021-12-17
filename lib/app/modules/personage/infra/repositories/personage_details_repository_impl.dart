import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/errors.dart';
import '../../domain/repositories/personage_details_repository.dart';
import '../../domain/entities/personage.dart';
import '../datasources/personage_details_remote_datasource.dart';

class PersonageDetailsRepositoryImpl implements PersonageDetailsRepository {
  final PersonageDetailsRemoteDatasource datasource;

  PersonageDetailsRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, Personage>> get({
    required int id,
  }) async {
    try {
      final response = await datasource.get(id: id);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
