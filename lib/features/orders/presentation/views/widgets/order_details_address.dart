import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domin/entites/order_item_entity.dart';

class OrderDetailsAddress extends StatelessWidget {
  const OrderDetailsAddress({
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
          const Icon(
            Icons.location_on_rounded,
            size: 32,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delivery Address',
                style: AppTextStyles.bold19,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                getUser().name,
                style: AppTextStyles.semiBold16,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Address Name : ${orderItemEntity.addressEntity!.nameAddress}",
                style: AppTextStyles.semiBold16,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${orderItemEntity.addressEntity!.city},${orderItemEntity.addressEntity!.details}",
                maxLines: 2,
                style: AppTextStyles.semiBold16,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                orderItemEntity.addressEntity!.region,
                maxLines: 2,
                style: AppTextStyles.semiBold16,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Mobile : ${orderItemEntity.addressEntity!.notes}",
                style: AppTextStyles.semiBold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
