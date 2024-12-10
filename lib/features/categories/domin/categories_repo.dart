import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/core/errors/failures.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<ProductEntity>>> fetchAllProductsByCategoryId(
      {required int categoryId});
}
