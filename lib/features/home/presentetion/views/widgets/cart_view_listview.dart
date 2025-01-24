import 'package:ecommerce_app/features/home/domin/entites/cart_entity.dart';
import 'package:flutter/material.dart';

import 'cart_view_prodcut.dart';

class CartViewListView extends StatelessWidget {
  const CartViewListView({
    super.key,
    required this.cartEntity,
  });
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartEntity.cartItems.length,
      itemBuilder: (context, index) {
        return CartViewProduct(
          cartItemEntity: cartEntity.cartItems[index],
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.grey,
          thickness: .5,
          height: 20,
        );
      },
    );
  }
}
