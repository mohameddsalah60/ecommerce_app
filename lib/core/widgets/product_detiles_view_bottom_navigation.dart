import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_button.dart';

class ProductDetilesbottomNavigation extends StatelessWidget {
  const ProductDetilesbottomNavigation({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: productEntity.discount != 0
          ? MediaQuery.sizeOf(context).height * .15
          : MediaQuery.sizeOf(context).height * .10,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 10,
            color: Colors.black38,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: productEntity.discount != 0
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
          children: [
            productEntity.discount != 0
                ? IsPriceDiscountProduct(
                    discount: productEntity.discount.toString(),
                    price: productEntity.price.toString(),
                    oldPrice: productEntity.oldPrice.toString(),
                  )
                : NormalPriceProduct(productEntity: productEntity),
            Expanded(
              flex: productEntity.discount != 0 ? 3 : 2,
              child: const CustomButton(
                text: 'Add to cart',
                radius: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NormalPriceProduct extends StatelessWidget {
  const NormalPriceProduct({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "EGP ${productEntity.price}",
          style: AppTextStyles.bold19.copyWith(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
    ));
  }
}

class IsPriceDiscountProduct extends StatelessWidget {
  const IsPriceDiscountProduct({
    super.key,
    required this.discount,
    required this.price,
    required this.oldPrice,
  });
  final String discount, price, oldPrice;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
          const SizedBox(
            height: 4,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "EGP $oldPrice",
              style: AppTextStyles.bold19.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.secnderyColor),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "EGP $price",
              style: AppTextStyles.bold19.copyWith(
                color: AppColors.primaryColor,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
