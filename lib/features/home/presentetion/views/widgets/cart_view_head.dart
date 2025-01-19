import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({
    super.key,
    required this.countItems,
  });
  final int countItems;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.sizeOf(context).width,
      color: const Color(0xffEBF9F1),
      child: Center(
        child: Text(
          '$countItems Items in Your Cart',
          style: AppTextStyles.regular16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
