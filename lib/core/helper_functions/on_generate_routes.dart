import 'package:ecommerce_app/features/auth/presentetion/views/sign_in_view.dart';
import 'package:ecommerce_app/features/splash/presentetion/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
