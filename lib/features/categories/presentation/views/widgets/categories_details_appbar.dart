import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domin/entites/categories_entity.dart';
import 'show_categories_bottom_sheet.dart';

class CategoriesDetailsAppbar extends StatelessWidget {
  const CategoriesDetailsAppbar({
    super.key,
    required this.categories,
    required this.index,
  });
  final List<CategoriesEntity> categories;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: GestureDetector(
            onTap: () {
              showCategoriesBottomSheet(context, categories);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  categories[index].name,
                  style: AppTextStyles.bold19
                      .copyWith(color: AppColors.primaryColor),
                ),
                const SizedBox(
                  width: 8,
                ),
                SvgPicture.asset(
                  Assets.imagesArrowDown,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                  width: 16,
                ),
              ],
            ),
          ),
          trailing: GestureDetector(
            onTap: () {},
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: .5),
              ),
              child: const Center(
                child: Icon(
                  Icons.search_sharp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
