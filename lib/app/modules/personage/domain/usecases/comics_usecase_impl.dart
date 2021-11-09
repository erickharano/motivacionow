import 'package:dartz/dartz.dart';

import '../../../core/helpers/errors/failure.dart';
import '../entities/comics.dart';
import '../dtos/comics_dto.dart';
import '../repositories/comics_repository.dart';
import 'comics_usecase.dart';

class ComicsUsecaseImpl implements ComicsUsecase {
  final ComicsRepository repository;

  const ComicsUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Comics>>> call({
    required ComicsDTO params,
  }) {
    return repository.getAll(params: params);
  }
}
