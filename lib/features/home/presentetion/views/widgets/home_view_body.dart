import 'package:ecommerce_app/features/home/presentetion/views/widgets/home_view_body_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_view_body_appbar.dart';
import 'home_view_body_categories.dart';
import 'home_view_body_offers.dart';
import 'home_view_body_pageview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            HomeViewBodyAppBar(),
            SizedBox(
              height: 16,
            ),
            HomeViewBodySearch(),
            SizedBox(
              height: 16,
            ),
            HomeViewBodyPageview(),
            SizedBox(
              height: 16,
            ),
            HomeViewBodyCategories(),
            SizedBox(
              height: 16,
            ),
            HomeViewBodyOffers(),
          ],
        ),
      ),
    );
  }
}
