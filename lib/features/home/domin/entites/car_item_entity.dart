import 'package:ecommerce_app/core/entites/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  final int cartProductId;
  dynamic quanitty;

  CartItemEntity({
    required this.productEntity,
    required this.cartProductId,
    this.quanitty = 1,
  });
  increasQuantity() {
    quanitty++;
  }

  decreasQuantity() {
    if (quanitty != 1) {
      quanitty--;
    }
  }

  num calculateTotalPrice() {
    return productEntity.price * quanitty;
  }
}
