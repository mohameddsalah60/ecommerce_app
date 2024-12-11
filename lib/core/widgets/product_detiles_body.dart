import 'package:flutter/material.dart';

import '../../features/home/presentetion/views/widgets/offers_listview.dart';
import '../entites/product_entity.dart';
import '../utils/app_text_styles.dart';
import 'product_detiles.dart';
import 'product_detiles_header.dart';

class ProductDetilesViewBody extends StatelessWidget {
  const ProductDetilesViewBody({
    super.key,
    required this.products,
    required this.index,
  });

  final List<ProductEntity> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            products: products,
          ),
        ],
      ),
    );
  }
}
