import 'package:dartz/dartz.dart';

import '../../../../../core/helpers/errors/failure.dart';
import '../dtos/comics_dto.dart';
import '../entities/comics.dart';

abstract class ComicsRepository {
  Future<Either<Failure, List<Comics>>> getAll({
    required ComicsDTO params,
  });
}
