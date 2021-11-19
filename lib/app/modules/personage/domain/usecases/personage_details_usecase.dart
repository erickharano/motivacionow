import 'package:dartz/dartz.dart';

import '../../../core/helpers/errors/failure.dart';
import '../entities/personage.dart';

abstract class PersonageDetailsUsecase {
  Future<Either<Failure, Personage>> call({
    required int id,
  });
}
