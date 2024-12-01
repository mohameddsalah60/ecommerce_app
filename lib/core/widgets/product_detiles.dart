import 'package:flutter/material.dart';

import '../entites/product_entity.dart';
import '../utils/app_text_styles.dart';
import 'product_description_widget.dart';

class ProductDetiles extends StatelessWidget {
  const ProductDetiles({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            product.name,
            style: AppTextStyles.bold19.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ProductDescriptionWidget(description: product.description),
        ],
      ),
    );
  }
}
