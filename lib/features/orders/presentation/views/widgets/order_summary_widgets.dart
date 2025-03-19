import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OrderSummaryWidgets extends StatelessWidget {
  const OrderSummaryWidgets({
    super.key,
    required this.title,
    required this.numper,
  });

  final String title, numper;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.semiBold16,
          ),
          Text(
            numper,
            style: AppTextStyles.semiBold16,
          ),
        ],
      ),
    );
  }
}
