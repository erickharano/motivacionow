import 'package:dartz/dartz.dart';

import '../../../../../core/helpers/errors/failure.dart';
import '../dtos/comics_dto.dart';
import '../entities/comic.dart';

abstract class ComicsUsecase {
  Future<Either<Failure, List<Comic>>> call({
    required ComicsDTO params,
  });
}
