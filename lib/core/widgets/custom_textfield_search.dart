import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextfieldSearch extends StatelessWidget {
  const CustomTextfieldSearch(
      {super.key,
      this.textFieldColor = Colors.white,
      this.onChanged,
      this.enabled});
  final Color textFieldColor;
  final bool? enabled;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      enabled: enabled,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: textFieldColor,
        fillColor: textFieldColor,
        hintText: 'Search here ...',
        hintStyle: AppTextStyles.bold13.copyWith(
          color: textFieldColor.withValues(alpha: .75),
        ),
        disabledBorder: buildBorder(),
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
        width: textFieldColor == Colors.white ? 1 : .5,
        color: textFieldColor,
      ),
      borderRadius: BorderRadius.circular(6),
    );
  }
}
