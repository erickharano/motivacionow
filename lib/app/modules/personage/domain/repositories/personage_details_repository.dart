import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/errors.dart';
import '../entities/personage.dart';

abstract class PersonageDetailsRepository {
  Future<Either<Failure, Personage>> get({
    required int id,
  });
}
