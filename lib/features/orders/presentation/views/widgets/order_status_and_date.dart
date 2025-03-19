import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_status_order_color.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class OrderStatusAndDate extends StatelessWidget {
  const OrderStatusAndDate({
    super.key,
    required this.orderStatus,
    required this.orderDate,
  });
  final String orderStatus, orderDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.greyLightColor,
          ),
          child: Text(
            orderStatus,
            style: AppTextStyles.bold19
                .copyWith(color: getStatusColor(orderStatus)),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          orderDate,
          style: AppTextStyles.bold19.copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}
