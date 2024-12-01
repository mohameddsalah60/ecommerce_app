import 'package:ecommerce_app/features/auth/presentetion/views/sign_in_view.dart';
import 'package:ecommerce_app/features/auth/presentetion/views/sign_up_view.dart';
import 'package:ecommerce_app/features/home/presentetion/views/main_view.dart';
import 'package:ecommerce_app/features/splash/presentetion/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../entites/product_entity.dart';
import '../views/product_detiles_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case ProductDetilesView.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>;
      final index = args['index'] as int;
      final listproducts = args['products'] as List<ProductEntity>;
      return MaterialPageRoute(
        builder: (context) => ProductDetilesView(
          index: index,
          products: listproducts,
        ),
      );

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
