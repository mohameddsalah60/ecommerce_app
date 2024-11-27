import 'package:ecommerce_app/features/auth/presentetion/views/sign_in_view.dart';
import 'package:ecommerce_app/features/auth/presentetion/views/sign_up_view.dart';
import 'package:ecommerce_app/features/home/presentetion/views/main_view.dart';
import 'package:ecommerce_app/features/splash/presentetion/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../entites/product_entity.dart';
import '../views/product_detiles.dart';

Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case ProductDetiles.routeName:
      final product = routeSettings.arguments as ProductEntity;
      return MaterialPageRoute(
          builder: (context) => ProductDetiles(
                product: product,
              ));

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
