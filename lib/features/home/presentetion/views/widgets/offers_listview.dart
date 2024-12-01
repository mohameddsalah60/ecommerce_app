import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/views/product_detiles_view.dart';
import '../../../../../core/widgets/custom_product_item.dart';

class OffersListview extends StatelessWidget {
  const OffersListview({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .30,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
              productEntity: products[index],
            ),
          );
        },
      ),
    );
  }
}
