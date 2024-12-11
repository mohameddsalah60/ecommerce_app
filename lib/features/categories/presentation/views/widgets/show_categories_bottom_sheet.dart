import 'package:ecommerce_app/features/categories/domin/entites/categories_entity.dart';
import 'package:ecommerce_app/features/categories/presentation/views/widgets/custom_grid_view_categories.dart';
import 'package:flutter/material.dart';

import 'appbar_detailes_view.dart';

void showCategoriesBottomSheet(
  BuildContext context,
  List<CategoriesEntity> categories,
) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * .55,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            const AppBarCategoriesBottomSheetView(),
            const SizedBox(
              height: 16,
            ),
            CustomGridViewCategories(categories: categories),
          ],
        ),
      );
    },
  );
}
