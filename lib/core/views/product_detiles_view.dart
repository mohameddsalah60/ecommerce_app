import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/features/home/presentetion/views/widgets/offers_listview.dart';
import 'package:flutter/material.dart';

import '../entites/product_entity.dart';
import '../widgets/product_detiles.dart';
import '../widgets/product_detiles_header.dart';
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
      bottomNavigationBar: ProductDetilesbottomNavigation(
        productEntity: products[index],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProductDetilesHeader(
                images: products[index].images,
              ),
              ProductDetiles(
                product: products[index],
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Colors.grey.shade800,
                  thickness: .5,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Shop more for less',
                    style: AppTextStyles.bold19,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              OffersListview(
                products: products
                    .where((prod) => prod.id != products[index].id)
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
