import 'package:ecommerce_app/core/helper_functions/custom_snack_bar.dart';
import 'package:ecommerce_app/features/orders/presentation/views/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../home/presentetion/cubits/cart_item_cubit/cart_item_cubit.dart';
import '../../../domin/entites/order_item_entity.dart';

class OrderAgeinButton extends StatelessWidget {
  const OrderAgeinButton({
    super.key,
    required this.orderItemEntity,
  });

  final OrderItemEntity orderItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartItemCubit, CartItemState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          Navigator.of(context).pushReplacementNamed(CheckoutView.routeName);
        } else if (state is CartItemFailure) {
          customSnackBar(context, text: state.message);
        }
      },
      builder: (context, state) => CustomButton(
        isLoading: state is CartItemLoading ? true : false,
        text: 'Order Agein',
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          bool isCartNotEmpty =
              context.read<CartItemCubit>().cartEntity.cartItems.isNotEmpty;

          if (isCartNotEmpty) {
            customSnackBar(
              context,
              text: 'your cart is not empty,please claer firest',
            );
          } else {
            for (var item in orderItemEntity.products!) {
              context
                  .read<CartItemCubit>()
                  .addOrRemoveProductToCart(productId: item.id);
            }
          }
        },
      ),
    );
  }
}
