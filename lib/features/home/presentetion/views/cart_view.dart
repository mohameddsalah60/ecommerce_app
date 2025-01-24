import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_item_cubit/cart_item_cubit.dart';
import 'widgets/cart_view_body.dart';
import 'widgets/cart_view_checkout_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'cartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'My Cart'),
      bottomNavigationBar:
          context.watch<CartItemCubit>().cartEntity.cartItems.isEmpty
              ? null
              : const CartViewCheckoutButton(),
      body: const SafeArea(child: CartViewBody()),
    );
  }
}
