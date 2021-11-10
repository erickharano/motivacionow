import 'package:dartz/dartz.dart';

import '../../../core/helpers/errors/failure.dart';
import '../dtos/personage_dto.dart';
import '../repositories/personage_repository.dart';
import '../entities/personage.dart';
import 'personage_usecase.dart';

class PersonageUsacaseImpl implements PersonageUsecase {
  final PersonageRepository repository;

  const PersonageUsacaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Personage>>> call({
    required PersonageDTO params,
  }) {
    return repository.getAll(params: params);
  }
}
