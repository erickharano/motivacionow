import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

import '../entities/personage.dart';

abstract class PersonageDetailsRepository {
  Future<Either<Failure, Personage>> get({
    required int id,
  });
}
