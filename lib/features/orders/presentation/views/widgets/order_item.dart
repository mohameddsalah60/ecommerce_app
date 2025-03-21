import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';
import 'package:ecommerce_app/features/orders/presentation/views/order_detils_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/format_date.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'order_item_button.dart';
import 'order_status_and_date.dart';
import 'rating_order.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.orderItemEntity,
  });
  final OrderItemEntity orderItemEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                OrderStatusAndDate(
                  orderStatus: orderItemEntity.status!,
                  orderDate: formatDate(orderItemEntity.date),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(
                  color: Colors.black26,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Order ID: #${orderItemEntity.id}',
                  style: AppTextStyles.bold19.copyWith(color: Colors.black45),
                ),
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    'EGP ${orderItemEntity.total}',
                    style: AppTextStyles.bold16,
                  ),
                  subtitle: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        OrderDetailsView.routeName,
                        arguments: orderItemEntity.id,
                      );
                    },
                    child: Text(
                      'View details',
                      style: AppTextStyles.semiBold16.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  trailing: OrderItemButton(
                    orderItemEntity: orderItemEntity,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const RatingOrder(),
        ],
      ),
    );
  }
}
