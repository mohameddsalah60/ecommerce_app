import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'home_view_body_appbar.dart';
import 'home_view_body_banners.dart';
import 'home_view_body_search.dart';

class HomeViewBodyHeader extends StatelessWidget {
  const HomeViewBodyHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: const Column(
        children: [
          HomeViewBodyAppBar(),
          SizedBox(
            height: 16,
          ),
          HomeViewBodySearch(),
          SizedBox(
            height: 16,
          ),
          HomeViewBodyBanners(),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
