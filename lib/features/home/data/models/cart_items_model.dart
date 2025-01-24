import 'package:ecommerce_app/features/home/data/models/car_item_model.dart';
import 'package:ecommerce_app/features/home/domin/entites/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.cartItems,
    super.total,
    super.subTotal,
  });
  factory CartModel.fromJson(Map<String, dynamic> data) {
    return CartModel(
      cartItems: (data['cart_items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      total: data['total'] as num,
      subTotal: data['sub_total'] as num,
    );
  }
}
