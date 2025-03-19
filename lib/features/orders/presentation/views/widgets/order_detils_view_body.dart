import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';
import 'package:ecommerce_app/features/orders/presentation/views/widgets/order_details_summary.dart';
import 'package:flutter/material.dart';

import 'order_details_actions_button.dart';
import 'order_details_address.dart';
import 'order_details_divider.dart';
import 'order_details_header.dart';
import 'order_details_products.dart';

class OrderDetilsViewBody extends StatelessWidget {
  const OrderDetilsViewBody({super.key, required this.orderItemEntity});
  final OrderItemEntity orderItemEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          OrderDetilsHeader(orderItemEntity: orderItemEntity),
          const OrderDetailsDivider(),
          OrderDetailsAddress(orderItemEntity: orderItemEntity),
          const OrderDetailsDivider(),
          OrderDetailsProducts(orderItemEntity: orderItemEntity),
          const OrderDetailsDivider(),
          OrderDetailsSummary(orderItemEntity: orderItemEntity),
          OrderDetailsActionsButton(orderItemEntity: orderItemEntity),
        ],
      ),
    );
  }
}
