import 'package:ecommerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerce_app/features/home/presentetion/views/widgets/cart_item_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entites/product_entity.dart';
import '../../../domin/entites/car_item_entity.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';
import '../../../../../core/widgets/custom_button.dart';

class AddProductToCartButton extends StatelessWidget {
  const AddProductToCartButton({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .10,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 10,
            color: Colors.black38,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: BlocConsumer<CartItemCubit, CartItemState>(
          listener: (context, state) {
            if (state is CartItemAdded) {
              if (state.cartItemEntity.productEntity.id == productEntity.id) {
                productEntity.inCart =
                    state.cartItemEntity.productEntity.inCart;
              }
            } else if (state is CartItemRemoved) {
              if (state.cartItemEntity.productEntity.id == productEntity.id) {
                productEntity.inCart =
                    state.cartItemEntity.productEntity.inCart;
              }
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
                          context
                              .read<CartItemCubit>()
                              .addOrRemoveProductToCart(
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
                        context.read<CartItemCubit>().addOrRemoveProductToCart(
                            productId: productEntity.id);
                      },
                    );
            }
          },
        ),
      ),
    );
  }
}
