import 'package:dartz/dartz.dart';

import '../../../core/helpers/url/personage.dart';
import '../../../core/helpers/errors/failure.dart';
import '../dtos/personage_dto.dart';

abstract class PersonageUsecase {
  Future<Either<Failure, List<Personage>>> call({
    required PersonageDTO params,
  });
}
