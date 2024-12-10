import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextfieldSearch extends StatelessWidget {
  const CustomTextfieldSearch({super.key, this.textFieldColor = Colors.white});
  final Color textFieldColor;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: textFieldColor,
        fillColor: textFieldColor,
        hintText: 'Search here ...',
        hintStyle: AppTextStyles.bold13.copyWith(
          color: textFieldColor.withOpacity(.50),
        ),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
      style: AppTextStyles.semiBold16.copyWith(
        color: textFieldColor,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: textFieldColor,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
