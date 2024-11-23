import 'package:flutter/material.dart';

import 'custom_action_home_view.dart';
import 'offers_listview.dart';

class HomeViewBodyOffers extends StatelessWidget {
  const HomeViewBodyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomActionHomeViewBoy(
            text: 'One Day Offers! 🔥',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        OffersListview(),
      ],
    );
  }
}
