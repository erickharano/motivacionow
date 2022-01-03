import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

import '../dtos/personage_dto.dart';
import '../repositories/personage_repository.dart';
import '../entities/personage.dart';
import 'personage_usecase.dart';

class PersonageUsecaseImpl implements PersonageUsecase {
  final PersonageRepository repository;

  const PersonageUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Personage>>> call({
    required PersonageDTO params,
  }) {
    return repository.getAll(params: params);
  }
}
