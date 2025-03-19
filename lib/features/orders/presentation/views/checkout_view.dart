import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/orders/presentation/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domin/repo/orders_repo.dart';
import 'widgets/checkout_place_order_button.dart';
import 'widgets/checkout_view_body_bloc_cunsmer.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = 'new_order_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOrdersCubit(getIt<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'Checkout',
          onTap: () => Navigator.of(context).pop(),
        ),
        bottomNavigationBar: const CheckoutPlaceOrderButton(),
        body: const SafeArea(child: CheckoutViewBodyBlocConsumer()),
      ),
    );
  }
}
