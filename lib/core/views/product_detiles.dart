import 'package:flutter/material.dart';

import '../entites/product_entity.dart';

class ProductDetiles extends StatelessWidget {
  const ProductDetiles({super.key, required this.product});
  static const routeName = 'pro-detiles';
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Product: ${product.name}"),
            Text("Price: ${product.price}"),
          ],
        ),
      ),
    );
  }
}
