import 'package:ecommerce_app/core/utils/app_text_styles.dart'
    show AppTextStyles;
import 'package:flutter/material.dart';

import 'custom_loading_indicator.dart';

class CustomTextAndLoading extends StatelessWidget {
  const CustomTextAndLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomLoadingIndicator(),
        SizedBox(
          height: 16,
        ),
        Text(
          "Loading...",
          style: AppTextStyles.semiBold16,
        ),
      ],
    );
  }
}
