import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> fetchAllProductsByCategoryId({
    required String categoryId,
  });

  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts(
      {bool? isOffers});
}
