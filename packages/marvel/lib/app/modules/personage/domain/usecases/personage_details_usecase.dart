import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

import '../entities/personage.dart';

abstract class PersonageDetailsUsecase {
  Future<Either<Failure, Personage>> call({
    required int id,
  });
}
