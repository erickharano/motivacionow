import 'package:dartz/dartz.dart';

import '../../../core/helpers/errors/failure.dart';
import '../../../core/helpers/url/personage.dart';
import '../dtos/personage_dto.dart';

abstract class PersonageRepository {
  Future<Either<Failure, List<Personage>>> getAll({
    required PersonageDTO params,
  });
}
