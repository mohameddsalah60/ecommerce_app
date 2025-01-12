import 'package:flutter/material.dart';

import '../../../../../core/entites/product_entity.dart';
import '../../../../../core/widgets/custom_product_item.dart';
import '../product_detiles_view.dart';

class ProductDetilesListView extends StatelessWidget {
  const ProductDetilesListView({
    super.key,
    required this.products,
    required this.index,
  });

  final List<ProductEntity> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .30,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          if (index == i) {
            return const SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomProductItem(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductDetilesView.routeName,
                  arguments: {
                    'index': i,
                    'products': products,
                  },
                );
              },
              productEntity: products[i],
            ),
          );
        },
      ),
    );
  }
}
