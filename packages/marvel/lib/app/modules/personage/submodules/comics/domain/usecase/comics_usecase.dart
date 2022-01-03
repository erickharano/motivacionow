import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

import '../dtos/comics_dto.dart';
import '../entities/comic.dart';

abstract class ComicsUsecase {
  Future<Either<Failure, List<Comic>>> call({
    required ComicsDTO params,
  });
}
