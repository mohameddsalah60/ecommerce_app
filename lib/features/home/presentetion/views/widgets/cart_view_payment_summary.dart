import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CartViewPaymentSummary extends StatelessWidget {
  const CartViewPaymentSummary({
    super.key,
    required this.cartTotal,
    required this.discountTotal,
    required this.totalAmount,
    required this.serviceFee,
  });
  final num cartTotal, discountTotal, totalAmount, serviceFee;
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
              leading: Text(
                'Discount',
                style: AppTextStyles.semiBold16.copyWith(
                    color: discountTotal > 0
                        ? AppColors.primaryColor
                        : Colors.black),
              ),
              trailing: Text(
                discountTotal > 0
                    ? '- EGP ${discountTotal.toString()}'
                    : 'EGP 0',
                style: AppTextStyles.semiBold16.copyWith(
                    color: discountTotal > 0
                        ? AppColors.primaryColor
                        : Colors.black),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Text(
                'Service Fee (14%)',
                style: AppTextStyles.semiBold16,
              ),
              trailing: Text(
                'EGP ${serviceFee.toString()}',
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
