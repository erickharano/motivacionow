import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

import '../dtos/comics_dto.dart';
import '../entities/comic.dart';

abstract class ComicsRepository {
  Future<Either<Failure, List<Comic>>> getAll({
    required ComicsDTO params,
  });
}
