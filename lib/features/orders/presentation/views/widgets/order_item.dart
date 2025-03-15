import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'order_item_button.dart';
import 'order_status_and_date.dart';
import 'rating_order.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

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
                const OrderStatusAndDate(
                  orderStatus: 'New',
                  orderDate: '14 / 03 / 2025',
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
                  'Order ID: #145555',
                  style: AppTextStyles.bold19.copyWith(color: Colors.black45),
                ),
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    'EGP 585',
                    style: AppTextStyles.bold16,
                  ),
                  subtitle: GestureDetector(
                    child: Text(
                      'View details',
                      style: AppTextStyles.semiBold16.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  trailing: const OrderItemButton(),
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
