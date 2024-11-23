import 'package:ecommerce_app/features/home/domin/entites/categories_entity.dart';
import 'package:flutter/material.dart';

import 'custom_categories_item.dart';

class CustomGridViewCategories extends StatelessWidget {
  const CustomGridViewCategories({
    super.key,
    required this.categories,
  });
  final List<CategoriesEntity> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .30,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CustomCategoriesItem(
            imageUrl: categories[index].img,
            title: categories[index].name,
          );
        },
      ),
    );
  }
}
