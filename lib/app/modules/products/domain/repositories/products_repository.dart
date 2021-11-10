import 'package:dartz/dartz.dart';

import '../../../core/helpers/errors/failure.dart';
import '../dtos/product_dto.dart';
import '../entities/products.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Products>>> getAll({
    required ProductDTO params,
  });
}
