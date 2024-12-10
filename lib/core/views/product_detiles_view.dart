import 'package:flutter/material.dart';

import '../entites/product_entity.dart';
import '../widgets/product_detiles_body.dart';
import '../widgets/product_detiles_view_bottom_navigation.dart';

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
      bottomNavigationBar: const ProductDetilesbottomNavigation(),
      body: SafeArea(
        child: ProductDetilesViewBody(
          products: products,
          index: index,
        ),
      ),
    );
  }
}
