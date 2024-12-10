import 'package:flutter/material.dart';

import 'categories_details_appbar.dart';
import 'categories_details_bloc_builder.dart';

class CategoriesDetailsBody extends StatelessWidget {
  const CategoriesDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CategoriesDetailsAppbar(),
          SizedBox(
            height: 16,
          ),
          CategoriesDetailsBlocBuilder()
        ],
      ),
    );
  }
}
