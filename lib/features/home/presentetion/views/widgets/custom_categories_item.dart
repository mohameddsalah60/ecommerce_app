import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomCategoriesItem extends StatelessWidget {
  const CustomCategoriesItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .11,
      width: MediaQuery.sizeOf(context).width * .23,
      decoration: BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          errorBuilder: (context, url, error) {
            return const Center(
              child: Icon(Icons.error),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const Center(
                child: CustomLoadingIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
