import 'package:flutter/material.dart';

import '../../../../../core/entites/product_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProductButtomDetiels extends StatelessWidget {
  const ProductButtomDetiels({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            productEntity.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: AppTextStyles.semiBold16,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "EGP ${productEntity.price.toString()}",
                  style: AppTextStyles.bold16
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              productEntity.discount != 0
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "EGP ${productEntity.oldPrice.toString()}",
                        style: AppTextStyles.bold16.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.secnderyColor),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
