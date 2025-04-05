import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:ecommerce_app/features/auth/presentetion/views/sign_in_view.dart';
import 'package:ecommerce_app/features/auth/presentetion/views/sign_up_view.dart';
import 'package:ecommerce_app/features/categories/domin/entites/categories_entity.dart';
import 'package:ecommerce_app/features/home/presentetion/views/main_view.dart';
import 'package:ecommerce_app/features/splash/presentetion/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/addresses/presentation/views/new_address_view.dart';
import '../../features/addresses/presentation/views/address_map_view.dart';
import '../../features/categories/presentation/views/categories_details_view.dart';
import '../../features/home/presentetion/views/cart_view.dart';
import '../../features/home/presentetion/views/notifications_user_view.dart';
import '../../features/home/presentetion/views/search_product_view.dart';
import '../../features/orders/presentation/views/checkout_view.dart';
import '../../features/orders/presentation/views/order_detils_view.dart';
import '../../features/orders/presentation/views/orders_items_view.dart';
import '../../features/profile/presentation/views/my_account_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
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
    case AddressMapView.routeName:
      return MaterialPageRoute(builder: (context) => const AddressMapView());
    case AddressDetilesView.routeName:
      final args = routeSettings.arguments as AddressEntity;

      return MaterialPageRoute(
          builder: (context) => AddressDetilesView(
                addressEntity: args,
              ));

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => const CheckoutView());

    case OrdersItemsView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersItemsView());
    case OrderDetailsView.routeName:
      final args = routeSettings.arguments as int;

      return MaterialPageRoute(
          builder: (context) => OrderDetailsView(
                iD: args,
              ));
    case SearchProductView.routeName:
      return MaterialPageRoute(builder: (context) => const SearchProductView());
    case NotificationsUserView.routeName:
      return MaterialPageRoute(
          builder: (context) => const NotificationsUserView());
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case MyAccountView.routeName:
      return MaterialPageRoute(builder: (context) => const MyAccountView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
