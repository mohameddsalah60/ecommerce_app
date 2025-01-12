import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';

class CustomCategoriesItem extends StatelessWidget {
  const CustomCategoriesItem(
      {super.key, required this.imageUrl, required this.title});
  final String imageUrl, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .10,
          width: MediaQuery.sizeOf(context).width * .23,
          decoration: BoxDecoration(
            color: AppColors.greyLightColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: CustomImageNetwork(image: imageUrl),
        ),
        const SizedBox(
          height: 8,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: AppTextStyles.bold16,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
