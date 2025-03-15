import 'package:ecommerce_app/features/orders/presentation/views/order_successfully_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/custom_snack_bar.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../../../home/presentetion/cubits/cart_item_cubit/cart_item_cubit.dart';
import '../../cubits/add_new_order_cubit/add_new_order_cubit.dart';
import 'checkout_view_body.dart';

class CheckoutViewBodyBlocConsumer extends StatelessWidget {
  const CheckoutViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewOrderCubit, AddNewOrderState>(
      listener: (context, state) {
        if (state is AddNewOrderFailure) {
          customSnackBar(context, text: state.message);
        } else if (state is AddNewOrderSuccsess) {
          context.read<CartItemCubit>().cartEntity.cartItems.clear();
          context.read<CartItemCubit>().fetchAllProductsInCart();
          Navigator.of(context).pushReplacementNamed(
              OrderSuccessfullyView.routeName,
              arguments: state.orderId);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddNewOrderLoading,
            child: const CheckoutViewBody());
      },
    );
  }
}
