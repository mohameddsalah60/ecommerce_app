import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:flutter/material.dart';

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
      height: MediaQuery.sizeOf(context).height * .10,
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
