import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context,
    {required String title, void Function()? onTap, List<Widget>? actions}) {
  return AppBar(
    actions: actions,
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      title,
      style: AppTextStyles.bold19,
    ),
    leading: GestureDetector(
      onTap: onTap,
      child: const Icon(Icons.arrow_back_ios_new),
    ),
  );
}
