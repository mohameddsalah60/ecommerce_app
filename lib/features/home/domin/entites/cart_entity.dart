import 'dart:developer';

import 'package:ecommerce_app/core/entites/product_entity.dart';

import 'car_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  bool isExis(ProductEntity productId) {
    for (var carItem in cartItems) {
      if (carItem.productEntity.id == productId.id) {
        return true;
      }
    }
    return false;
  }

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  void removeCarItemById(int productId) {
    int index = cartItems.indexWhere(
      (item) => item.productEntity.id == productId,
    );

    if (index != -1) {
      cartItems.removeAt(index);
    } else {
      log("Item with id $productId not found in the cart.");
    }
  }
}
