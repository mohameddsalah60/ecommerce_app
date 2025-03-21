import 'package:ecommerce_app/core/helper_functions/on_generate_routes.dart';
import 'package:ecommerce_app/core/service/shared_preferences_service.dart';
import 'package:ecommerce_app/features/splash/presentetion/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/service/custom_bloc_observer.dart';
import 'core/service/get_it_service.dart';
import 'features/home/domin/repos/home_repo.dart';
import 'features/home/presentetion/cubits/cart_item_cubit/cart_item_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  setupGetIt();
  Bloc.observer = CustomBlocObserver();

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartItemCubit(getIt<HomeRepo>())..fetchAllProductsInCart(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashView.routeName,
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}
