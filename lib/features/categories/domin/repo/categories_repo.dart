import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/core/errors/failures.dart';

import '../entites/categories_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<ProductEntity>>> fetchAllProductsByCategoryId(
      {required int categoryId});
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
}
