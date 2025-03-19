import 'package:flutter/material.dart';

import '../../../domin/entites/order_item_entity.dart';
import 'order_item.dart';

class OrdersItemsViewBody extends StatelessWidget {
  const OrdersItemsViewBody({super.key, required this.orders});
  final List<OrderItemEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: OrderItem(
                  orderItemEntity: orders[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
