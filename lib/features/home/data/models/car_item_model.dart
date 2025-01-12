import 'package:ecommerce_app/features/home/domin/entites/car_item_entity.dart';

import '../../../../core/entites/product_entity.dart';
import '../../../../core/models/product_model.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.cartProductId,
    required super.quanitty,
    required super.productEntity,
  });
  factory CartItemModel.fromJson(Map<String, dynamic> data) {
    ProductEntity productEntity = ProductModel.fromJson(data['product']);
    return CartItemModel(
      cartProductId: data['id'],
      quanitty: data['quantity'],
      productEntity: productEntity,
    );
  }
}
