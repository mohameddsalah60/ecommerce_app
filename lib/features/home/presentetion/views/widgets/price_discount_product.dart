import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class IsPriceDiscountProduct extends StatelessWidget {
  const IsPriceDiscountProduct({
    super.key,
    required this.discount,
    required this.price,
    required this.oldPrice,
  });
  final int discount, price, oldPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "$price",
            style: AppTextStyles.bold19,
          ),
        ),
        const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "  EGP",
            style: AppTextStyles.semiBold16,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "$oldPrice",
            style: AppTextStyles.bold19.copyWith(
                decoration: TextDecoration.lineThrough,
                color: AppColors.secnderyColor),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "  EGP",
            style: AppTextStyles.semiBold16.copyWith(
                decoration: TextDecoration.lineThrough,
                color: AppColors.secnderyColor),
          ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(6),
          child: Text(
            'Save $discount%',
            style: AppTextStyles.bold16.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
