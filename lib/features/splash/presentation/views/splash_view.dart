import 'package:ecommerce_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: const SplashViewBody(),
    );
  }
}
