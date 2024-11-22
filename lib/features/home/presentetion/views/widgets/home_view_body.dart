import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_view_body_categories.dart';
import 'home_view_body_header.dart';
import 'home_view_body_offers.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HomeViewBodyHeader(),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: HomeViewBodyCategories(),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: HomeViewBodyOffers(),
          ),
        ],
      ),
    );
  }
}
