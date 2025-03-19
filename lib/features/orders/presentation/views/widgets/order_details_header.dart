import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_status_order_color.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domin/entites/order_item_entity.dart';
import 'order_store_logo.dart';

class OrderDetilsHeader extends StatelessWidget {
  const OrderDetilsHeader({
    super.key,
    required this.orderItemEntity,
  });

  final OrderItemEntity orderItemEntity;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderStoreLogo(),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'HyperMART',
                style: AppTextStyles.bold19,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                orderItemEntity.status!,
                style: AppTextStyles.semiBold16
                    .copyWith(color: getStatusColor(orderItemEntity.status!)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                orderItemEntity.date,
                style: AppTextStyles.semiBold16,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Order ID : ${orderItemEntity.id}',
                style: AppTextStyles.semiBold16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
