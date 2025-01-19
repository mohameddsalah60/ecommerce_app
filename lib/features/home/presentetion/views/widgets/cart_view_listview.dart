import 'package:flutter/material.dart';

import 'cart_view_prodcut.dart';

class CartViewListView extends StatelessWidget {
  const CartViewListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 3,
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
      ),
    );
  }
}
