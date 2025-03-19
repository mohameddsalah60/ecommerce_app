import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domin/entites/order_item_entity.dart';

class OrderDetailsProducts extends StatelessWidget {
  const OrderDetailsProducts({super.key, required this.orderItemEntity});
  final OrderItemEntity orderItemEntity;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ExpansionTile(
        iconColor: AppColors.primaryColor,
        tilePadding: EdgeInsets.zero,
        collapsedShape: const RoundedRectangleBorder(),
        shape: const RoundedRectangleBorder(),
        leading: const Icon(
          Icons.shopping_cart,
          size: 32,
        ),
        title: Text(
          'Products (${orderItemEntity.products!.length})',
          style: AppTextStyles.bold19,
        ),
        children: orderItemEntity.products!
            .map((product) => ListTile(
                leading: Text(
                  "${product.quantity.toString()} x",
                  style: AppTextStyles.semiBold16,
                ),
                trailing: Text(
                  "${product.price.toString()}EGP",
                  style: AppTextStyles.semiBold16,
                ),
                title: Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )))
            .toList(),
      ),
    );
  }
}
