import 'package:flutter/material.dart';

import '../../../../../core/entites/product_entity.dart';
import '../../../../home/presentetion/views/product_detiles_view.dart';
import '../../../../../core/widgets/custom_product_item.dart';

class CategoriesDetailsGridView extends StatelessWidget {
  const CategoriesDetailsGridView({
    super.key,
    required this.products,
  });
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          childAspectRatio: .75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomProductItem(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ProductDetilesView.routeName,
                    arguments: {
                      'index': index,
                      'products': products,
                    },
                  );
                },
                productEntity: products[index]),
          );
        },
      ),
    );
  }
}
