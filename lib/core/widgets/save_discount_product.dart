import 'package:flutter/material.dart';

import '../entites/product_entity.dart';
import '../utils/app_text_styles.dart';

class SaveDiscountProduct extends StatelessWidget {
  const SaveDiscountProduct({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.all(6),
        child: Text(
          'Save ${productEntity.discount}%',
          style: AppTextStyles.bold16.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
