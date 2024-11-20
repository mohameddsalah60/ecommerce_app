import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeViewBodySearch extends StatelessWidget {
  const HomeViewBodySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: const Color(0Xff939393),
        fillColor: const Color(0xffFFFFFF),
        hintText: 'Search here ...',
        hintStyle: AppTextStyles.bold13.copyWith(
          color: const Color(0xffC8C8CB),
        ),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
      style: AppTextStyles.semiBold16.copyWith(
        color: const Color(0xff000000),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.greyLightColor,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
