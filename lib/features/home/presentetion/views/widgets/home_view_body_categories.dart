import 'package:flutter/material.dart';

import 'custom_action_home_view.dart';
import 'custom_grid_view_categories.dart';

class HomeViewBodyCategories extends StatelessWidget {
  const HomeViewBodyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomActionHomeViewBoy(
          text: 'Categories',
        ),
        SizedBox(
          height: 16,
        ),
        CustomGridViewCategories(),
      ],
    );
  }
}
