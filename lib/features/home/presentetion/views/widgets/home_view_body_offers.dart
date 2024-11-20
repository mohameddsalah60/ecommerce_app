import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_action_home_view.dart';

class HomeViewBodyOffers extends StatelessWidget {
  const HomeViewBodyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomActionHomeViewBoy(
          text: 'One Day Offers! 🔥',
        ),
        SizedBox(
          height: 16,
        ),
        Card(
          color: Color(0xffFFFFFFF),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            height: 250,
            width: 170,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.greyLightColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        )
      ],
    );
  }
}
