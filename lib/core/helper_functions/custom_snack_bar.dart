import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

customSnackBar(context, {required String text, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red.shade400,
      content: Text(
        text,
        style: AppTextStyles.regular16,
      ),
    ),
  );
}
