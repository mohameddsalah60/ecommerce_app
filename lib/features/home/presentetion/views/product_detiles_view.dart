import 'package:flutter/material.dart';

import '../../../../core/entites/product_entity.dart';
import 'widgets/product_detiles_body.dart';
import 'widgets/add_product_to_cart_button.dart';

class ProductDetilesView extends StatelessWidget {
  const ProductDetilesView({
    super.key,
    required this.index,
    required this.products,
  });
  static const routeName = 'pro-detiles';
  final int index;
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AddProductToCartButton(
        productEntity: products[index],
      ),
      body: SafeArea(
        child: ProductDetilesViewBody(
          products: products,
          index: index,
        ),
      ),
    );
  }
}
