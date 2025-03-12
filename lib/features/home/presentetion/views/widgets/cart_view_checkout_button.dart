import 'package:ecommerce_app/features/home/presentetion/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/views/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';

class CartViewCheckoutButton extends StatelessWidget {
  const CartViewCheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .10,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
            width: .5,
            color: Colors.black,
          ))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
        child: BlocBuilder<CartItemCubit, CartItemState>(
          builder: (context, state) {
            return CustomButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(CheckoutView.routeName),
              text: "Checkout",
              radius: 24,
              isLoading: state is CartItemLoading ? true : false,
            );
          },
        ),
      ),
    );
  }
}
