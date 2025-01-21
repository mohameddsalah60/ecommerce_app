import 'package:flutter/material.dart';

import 'cart_view_prodcut.dart';

class CartViewListView extends StatelessWidget {
  const CartViewListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 2,
      itemBuilder: (context, index) {
        return const CartViewProduct();
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
