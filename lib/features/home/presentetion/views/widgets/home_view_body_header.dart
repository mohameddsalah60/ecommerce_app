import 'package:ecommerce_app/features/home/presentetion/views/search_product_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'home_view_body_appbar.dart';
import 'home_view_body_banners.dart';
import '../../../../../core/widgets/custom_textfield_search.dart';

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
      child: Column(
        children: [
          const HomeViewBodyAppBar(),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              SearchProductView.routeName,
            ),
            child: const CustomTextfieldSearch(enabled: false),
          ),
          const SizedBox(
            height: 16,
          ),
          const HomeViewBodyBanners(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
