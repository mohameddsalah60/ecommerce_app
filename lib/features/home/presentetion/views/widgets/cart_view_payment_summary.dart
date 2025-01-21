import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CartViewPaymentSummary extends StatelessWidget {
  const CartViewPaymentSummary({
    super.key,
    required this.cartTotal,
    required this.discountTotal,
    required this.totalAmount,
  });
  final int cartTotal, discountTotal, totalAmount;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Payment summary',
              style: AppTextStyles.bold19,
            ),
            const SizedBox(
              height: 6,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Text(
                'Cart total',
                style: AppTextStyles.semiBold16,
              ),
              trailing: Text(
                'EGP ${cartTotal.toString()}',
                style: AppTextStyles.semiBold16,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Text(
                'Discount',
                style: AppTextStyles.semiBold16,
              ),
              trailing: Text(
                '- EGP ${discountTotal.toString()}',
                style: AppTextStyles.semiBold16,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Text(
                'Total Amount',
                style: AppTextStyles.bold19,
              ),
              trailing: Text(
                'EGP ${totalAmount.toString()}',
                style: AppTextStyles.bold19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
