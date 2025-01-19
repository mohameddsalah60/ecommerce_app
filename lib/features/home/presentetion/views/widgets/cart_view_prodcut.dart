import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_image_network.dart';
import 'cart_item_action_buttons.dart';

class CartViewProduct extends StatelessWidget {
  const CartViewProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(
        width: 70,
        height: 80,
        child: CustomImageNetwork(
            image:
                'https://student.valuxapps.com/storage/uploads/products/1644374518pTaSB.10.jpg'),
      ),
      title: const Text(
        'Front Patch Pocket Long',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.bold16,
      ),
      subtitle: Text(
        '499 EGP',
        style: AppTextStyles.regular13.copyWith(color: const Color(0xff393939)),
      ),
      trailing: const FittedBox(
        fit: BoxFit.scaleDown,
        child: CartItemActionButtons(
          count: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
