import 'package:dartz/dartz.dart';
import 'package:motivacionow/app/modules/products/domain/dtos/product_dto.dart';
import 'package:motivacionow/app/modules/products/domain/entities/products.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Products>>> getAll({
    required ProductDTO params,
  });
}
