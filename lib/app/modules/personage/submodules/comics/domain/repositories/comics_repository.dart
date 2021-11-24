import 'package:dartz/dartz.dart';

import '../../../../../core/helpers/errors/failure.dart';
import '../dtos/comics_dto.dart';
import '../entities/comic.dart';

abstract class ComicsRepository {
  Future<Either<Failure, List<Comic>>> getAll({
    required ComicsDTO params,
  });
}
