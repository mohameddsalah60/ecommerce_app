import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_image_network.dart';
import '../../features/home/presentetion/views/widgets/product_bottom_detiels.dart';
import 'save_discount_product.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.productEntity,
    this.onTap,
  });
  final ProductEntity productEntity;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .30,
        width: MediaQuery.sizeOf(context).width * .45,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.greyLightColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: CustomImageNetwork(image: productEntity.image),
                    ),
                    productEntity.discount != 0
                        ? SaveDiscountProduct(productEntity: productEntity)
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            ProductButtomDetiels(productEntity: productEntity),
          ],
        ),
      ),
    );
  }
}
