import 'package:dartz/dartz.dart';

import '../../../core/helpers/errors/failure.dart';
import '../entities/personage.dart';

abstract class PersonageDetailsRepository {
  Future<Either<Failure, Personage>> get();
}
