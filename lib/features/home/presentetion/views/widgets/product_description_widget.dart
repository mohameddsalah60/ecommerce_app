import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description,
      trimLines: 4,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' Show More?',
      trimExpandedText: ' Show Less',
      style: AppTextStyles.semiBold16
          .copyWith(color: AppColors.bottomItemNavigationColor),
      moreStyle: AppTextStyles.bold16.copyWith(color: AppColors.primaryColor),
      lessStyle: AppTextStyles.bold16.copyWith(color: AppColors.primaryColor),
    );
  }
}
