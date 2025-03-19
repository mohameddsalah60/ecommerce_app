import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domin/entites/order_item_entity.dart';
import 'order_summary_widgets.dart';

class OrderDetailsSummary extends StatelessWidget {
  const OrderDetailsSummary({
    super.key,
    required this.orderItemEntity,
  });

  final OrderItemEntity orderItemEntity;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: AppTextStyles.bold19,
          ),
          OrderSummaryWidgets(
            title: 'Subtotal',
            numper: 'EGP${orderItemEntity.cost}',
          ),
          OrderSummaryWidgets(
            title: 'Service fee (14%)',
            numper: 'EGP${orderItemEntity.vat!.round()}',
          ),
          OrderSummaryWidgets(
            title: 'Total',
            numper: 'EGP${orderItemEntity.total}',
          ),
          OrderSummaryWidgets(
            title: 'Promo Code',
            numper: '${orderItemEntity.promoCode}',
          ),
          OrderSummaryWidgets(
            title: 'Payment Method',
            numper: '${orderItemEntity.paymentMethod}',
          ),
          const OrderSummaryWidgets(
            title: 'Delivery Time',
            numper: '25 min',
          ),
        ],
      ),
    );
  }
}
