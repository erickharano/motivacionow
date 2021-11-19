import 'package:dartz/dartz.dart';

import '../../../core/helpers/errors/failure.dart';
import '../repositories/personage_details_repository.dart';
import '../entities/personage.dart';
import 'personage_details_usecase.dart';

class PersonageDetailsUsecaseImpl implements PersonageDetailsUsecase {
  final PersonageDetailsRepository repository;

  const PersonageDetailsUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, Personage>> call() => repository.get();
}
