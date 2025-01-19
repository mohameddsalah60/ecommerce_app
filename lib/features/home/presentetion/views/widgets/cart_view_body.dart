import 'package:flutter/material.dart';

import 'cart_view_head.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 16,
        ),
        CartViewHeader(
          countItems: 1,
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
