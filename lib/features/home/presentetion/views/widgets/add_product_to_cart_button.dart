import 'package:flutter/material.dart';

import '../../../../../core/entites/product_entity.dart';

import 'add_product_bottom_bloc_builder.dart';

class AddProductToCartButton extends StatelessWidget {
  const AddProductToCartButton({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .10,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 10,
            color: Colors.black38,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: AddProductToCartBlocConsumer(productEntity: productEntity),
      ),
    );
  }
}
