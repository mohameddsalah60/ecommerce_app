import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domin/entites/bottom_navigation_bar_entity.dart';

class CustombottomNavigationBarItem extends StatelessWidget {
  const CustombottomNavigationBarItem({
    super.key,
    required this.bottomNavigationBarEntity,
    required this.isSelected,
  });
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height * .040,
            width: MediaQuery.sizeOf(context).width * .070,
            child: SvgPicture.asset(
              bottomNavigationBarEntity.icon,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.primaryColor
                    : AppColors.bottomItemNavigationColor,
                BlendMode.srcIn,
              ),
            )),
        Text(
          bottomNavigationBarEntity.title,
          style: AppTextStyles.semiBold13.copyWith(
            color:
                isSelected ? Colors.black : AppColors.bottomItemNavigationColor,
            fontSize: isSelected ? 15 : 13,
          ),
        ),
      ],
    );
  }
}
