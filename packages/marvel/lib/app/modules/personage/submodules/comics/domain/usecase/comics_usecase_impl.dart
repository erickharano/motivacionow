import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

import '../entities/comic.dart';
import '../dtos/comics_dto.dart';
import '../repositories/comics_repository.dart';
import 'comics_usecase.dart';

class ComicsUsecaseImpl implements ComicsUsecase {
  final ComicsRepository repository;

  const ComicsUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Comic>>> call({
    required ComicsDTO params,
  }) {
    return repository.getAll(params: params);
  }
}
