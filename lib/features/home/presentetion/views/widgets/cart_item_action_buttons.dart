import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domin/entites/car_item_entity.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({
    super.key,
    this.sizeIcon = 32,
    required this.cartItemEntity,
  });

  final CartItemEntity cartItemEntity;
  final double sizeIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              cartItemEntity.increasQuantity();
              context.read<CartItemCubit>().updateQuantityProduct(
                    cartIdProduct: cartItemEntity.cartProductId,
                    newQuantity: cartItemEntity.quanitty,
                  );
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.add,
                color: AppColors.primaryColor,
                size: sizeIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            cartItemEntity.quanitty.toString(),
            style: AppTextStyles.semiBold20,
          ),
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: () {
              if (cartItemEntity.quanitty == 1) {
                context.read<CartItemCubit>().addOrRemoveProductToCart(
                    productId: cartItemEntity.productEntity.id);
              } else {
                cartItemEntity.decreasQuantity();
                context.read<CartItemCubit>().updateQuantityProduct(
                      cartIdProduct: cartItemEntity.cartProductId,
                      newQuantity: cartItemEntity.quanitty,
                    );
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                cartItemEntity.quanitty <= 1 ? Icons.delete : Icons.remove,
                color: AppColors.primaryColor,
                size: sizeIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
