import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_product_item.dart';
import 'custom_action_home_view.dart';

class HomeViewBodyOffers extends StatelessWidget {
  const HomeViewBodyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomActionHomeViewBoy(
          text: 'One Day Offers! 🔥',
        ),
        SizedBox(
          height: 12,
        ),
        CustomProductItem(),
      ],
    );
  }
}
