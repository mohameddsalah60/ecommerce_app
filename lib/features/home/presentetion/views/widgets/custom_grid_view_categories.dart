import 'package:flutter/material.dart';

import 'custom_categories_item.dart';

class CustomGridViewCategories extends StatelessWidget {
  const CustomGridViewCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .33,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return const CustomCategoriesItem(
            imageUrl:
                "https://www.pngall.com/wp-content/uploads/7/Bakery-Items-PNG-Picture.png",
          );
        },
      ),
    );
  }
}
