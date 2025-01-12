import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class NormalPriceProduct extends StatelessWidget {
  const NormalPriceProduct({
    super.key,
    required this.price,
  });

  final int price;

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
      ],
    );
  }
}
