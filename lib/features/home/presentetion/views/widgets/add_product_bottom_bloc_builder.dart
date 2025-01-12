import 'package:ecommerce_app/core/helper_functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entites/product_entity.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../domin/entites/car_item_entity.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';
import 'cart_item_action_buttons.dart';

class AddProductToCartBlocConsumer extends StatelessWidget {
  const AddProductToCartBlocConsumer({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartItemCubit, CartItemState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          if (state.cartItemEntity.productEntity.id == productEntity.id) {
            productEntity.inCart = state.cartItemEntity.productEntity.inCart;
          }
          customSnackBar(context,
              text: 'Added Product to Cart Successfully', color: Colors.green);
        } else if (state is CartItemRemoved) {
          if (state.cartItemEntity.productEntity.id == productEntity.id) {
            productEntity.inCart = state.cartItemEntity.productEntity.inCart;
          }
          customSnackBar(context, text: 'Removed Product to Cart Successfully');
        }
      },
      builder: (context, state) {
        final productCartItem =
            context.read<CartItemCubit>().cartEntity.cartItems.firstWhere(
                  (item) => item.productEntity.id == productEntity.id,
                  orElse: () => CartItemEntity(
                      productEntity: productEntity, cartProductId: 0),
                );
        if (state is CartItemLoading) {
          return const CustomLoadingIndicator();
        } else {
          return productEntity.inCart
              ? CartItemActionButtons(
                  count: productCartItem.quanitty,
                  onTapAdd: () {
                    productCartItem.increasQuantity();
                    context.read<CartItemCubit>().updateQuantityProduct();
                  },
                  onTapRemove: () {
                    if (productCartItem.quanitty == 1) {
                      context.read<CartItemCubit>().addOrRemoveProductToCart(
                          productId: productEntity.id);
                    } else {
                      productCartItem.decreasQuantity();
                      context.read<CartItemCubit>().updateQuantityProduct();
                    }
                  },
                )
              : CustomButton(
                  text: 'Add to My cart',
                  radius: 6,
                  onPressed: () {
                    context
                        .read<CartItemCubit>()
                        .addOrRemoveProductToCart(productId: productEntity.id);
                  },
                );
        }
      },
    );
  }
}
