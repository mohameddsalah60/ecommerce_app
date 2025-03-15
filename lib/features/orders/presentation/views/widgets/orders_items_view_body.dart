import 'package:flutter/material.dart';

import 'order_item.dart';

class OrdersItemsViewBody extends StatelessWidget {
  const OrdersItemsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          OrderItem(),
        ],
      ),
    );
  }
}
