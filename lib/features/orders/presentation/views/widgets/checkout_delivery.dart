import 'package:ecommerce_app/features/orders/presentation/views/widgets/checkout_border_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CheckoutDelivery extends StatelessWidget {
  const CheckoutDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return const CheckoutBorderWidgets(
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Icon(
          Icons.delivery_dining_rounded,
          size: 32,
        ),
        title: Text(
          'Delivery',
          style: AppTextStyles.bold16,
        ),
        subtitle: Text(
          'Arriving in approx. 20 min',
          style: AppTextStyles.regular16,
        ),
      ),
    );
  }
}
