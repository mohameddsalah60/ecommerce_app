import 'package:flutter/material.dart';

import '../../../domin/entites/categories_entity.dart';
import 'categories_details_appbar.dart';
import 'categories_details_bloc_builder.dart';

class CategoriesDetailsBody extends StatelessWidget {
  const CategoriesDetailsBody({
    super.key,
    required this.categories,
    required this.index,
  });
  final List<CategoriesEntity> categories;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CategoriesDetailsAppbar(
            categories: categories,
            index: index,
          ),
          const SizedBox(
            height: 16,
          ),
          const CategoriesDetailsBlocBuilder()
        ],
      ),
    );
  }
}
