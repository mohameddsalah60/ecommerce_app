import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/car_item_model.dart';
import '../entites/banners_entity.dart';
import '../../../categories/domin/entites/categories_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, List<BannersEntity>>> getBanners();
  Future<Either<Failure, CartItemModel>> addOrRemoveProductToCart(
      {required int productId});
  Future<Either<Failure, void>> updateQuantityProductInCart(
      {required int cartIdProduct, required int newQuantity});
}
