import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/domin/entites/cart_entity.dart';

import '../../../../core/errors/failures.dart';
import '../entites/banners_entity.dart';
import '../../../categories/domin/entites/categories_entity.dart';
import '../entites/car_item_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, List<BannersEntity>>> getBanners();
  Future<Either<Failure, CartItemEntity>> addOrRemoveProductToCart(
      {required int productId});
  Future<Either<Failure, CartItemEntity>> updateQuantityProductInCart(
      {required int cartIdProduct, required int newQuantity});
  Future<Either<Failure, CartEntity>> getItemsCart();
}
