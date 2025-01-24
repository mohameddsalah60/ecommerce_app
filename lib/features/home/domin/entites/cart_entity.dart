import '../../../../core/entites/product_entity.dart';
import 'car_item_entity.dart';

class CartEntity {
  List<CartItemEntity> cartItems;
  num? total, subTotal;
  CartEntity({
    required this.cartItems,
    this.total = 0,
    this.subTotal = 0,
  });
  bool isExis(int productId) {
    return cartItems.any((item) => item.productEntity.id == productId);
  }

  void addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
    totalDiscount(cartItemEntity.productEntity);
  }

  void removeCarItemById(int productId) {
    int index = cartItems.indexWhere((item) {
      totalDiscount(item.productEntity);
      return item.productEntity.id == productId;
    });

    if (index != -1) {
      cartItems.removeAt(index);
    }
  }

  CartItemEntity getCarItem(ProductEntity product) {
    for (var carItem in cartItems) {
      if (carItem.productEntity.id == product.id) {
        return carItem;
      }
    }
    return CartItemEntity(
      productEntity: product,
      quanitty: 1,
      cartProductId: 0,
    );
  }

  double totalAmount() {
    double totalPrice = 0;
    for (var carItem in cartItems) {
      totalPrice += carItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  num totalDiscount(ProductEntity product) {
    if (isExis(product.id)) {
      if (product.discount != 0) {
        num discountAmount =
            (product.oldPrice - product.price) * getCarItem(product).quanitty;
        return discountAmount;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }

  num totalCartDiscount() {
    num totalDiscountAmount = 0;
    for (var item in cartItems) {
      totalDiscountAmount += totalDiscount(item.productEntity);
    }
    return totalDiscountAmount;
  }
}
