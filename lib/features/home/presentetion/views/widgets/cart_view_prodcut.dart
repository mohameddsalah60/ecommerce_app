import 'package:ecommerce_app/features/home/domin/entites/car_item_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_image_network.dart';
import 'cart_item_action_buttons.dart';

class CartViewProduct extends StatelessWidget {
  const CartViewProduct({
    super.key,
    required this.cartItemEntity,
  });
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 70,
        height: 80,
        child: CustomImageNetwork(image: cartItemEntity.productEntity.image),
      ),
      title: Text(
        cartItemEntity.productEntity.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.bold16,
      ),
      subtitle: Row(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              cartItemEntity.productEntity.discount != 0
                  ? "EGP ${cartItemEntity.productEntity.price}"
                  : "EGP ${cartItemEntity.productEntity.oldPrice}",
              style:
                  AppTextStyles.bold16.copyWith(color: AppColors.primaryColor),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          cartItemEntity.productEntity.discount != 0
              ? FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "EGP ${cartItemEntity.productEntity.oldPrice}",
                    style: AppTextStyles.bold16.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.secnderyColor),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      trailing: FittedBox(
        fit: BoxFit.scaleDown,
        child: CartItemActionButtons(
          cartItemEntity: cartItemEntity,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
