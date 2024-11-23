import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_product_item.dart';

class OffersListview extends StatelessWidget {
  const OffersListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .30,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomProductItem(),
          );
        },
      ),
    );
  }
}
