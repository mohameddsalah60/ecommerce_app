import 'package:ecommerce_app/features/auth/presentetion/views/sign_in_view.dart';
import 'package:ecommerce_app/features/auth/presentetion/views/sign_up_view.dart';
import 'package:ecommerce_app/features/categories/domin/entites/categories_entity.dart';
import 'package:ecommerce_app/features/home/presentetion/views/main_view.dart';
import 'package:ecommerce_app/features/splash/presentetion/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/addresses/presentation/views/address_detiles_view.dart';
import '../../features/addresses/presentation/views/new_address_view.dart';
import '../../features/categories/presentation/views/categories_details_view.dart';
import '../../features/home/presentetion/views/cart_view.dart';
import '../entites/product_entity.dart';
import '../../features/home/presentetion/views/product_detiles_view.dart';

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
    case CategoriesDetailsView.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>;
      final index = args['index'] as int;
      final listCategories = args['categories'] as List<CategoriesEntity>;

      return MaterialPageRoute(
        builder: (context) => CategoriesDetailsView(
          category: listCategories,
          index: index,
        ),
      );
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => const CartView());
    case NewAddressView.routeName:
      return MaterialPageRoute(builder: (context) => const NewAddressView());
    case AddressDetilesView.routeName:
      return MaterialPageRoute(
          builder: (context) => const AddressDetilesView());

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
