import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class OrderDetailsActionsButton extends StatelessWidget {
  const OrderDetailsActionsButton({
    super.key,
    required this.orderItemEntity,
  });
  final OrderItemEntity orderItemEntity;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child:
            orderItemEntity.status == 'New' || orderItemEntity.status == 'جديد'
                ? const CustomButton(
                    text: 'Cancel Order',
                    backgroundColor: Colors.white,
                  )
                : const CustomButton(
                    text: 'Get Help',
                    backgroundColor: AppColors.primaryColor,
                  ),
      ),
    );
  }
}
