import 'package:ecommerce_app/features/home/data/models/car_item_model.dart';
import 'package:ecommerce_app/features/home/domin/entites/cart_entity.dart';

class CartItemsModel extends CartEntity {
  CartItemsModel({
    required super.cartItems,
    super.total,
    super.subTotal,
  });
  factory CartItemsModel.fromJson(Map<String, dynamic> data) {
    return CartItemsModel(
      cartItems: (data['cart_items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      total: data['total'] as double,
      subTotal: data['sub_total'] as double,
    );
  }
}
