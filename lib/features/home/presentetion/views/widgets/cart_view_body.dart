import 'package:ecommerce_app/core/widgets/your_data_is_empty.dart';
import 'package:ecommerce_app/features/home/presentetion/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_view_head.dart';
import 'cart_view_listview.dart';
import 'cart_view_payment_summary.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.read<CartItemCubit>().cartEntity.cartItems.isEmpty
        ? const YourDataIsEmpty(text: 'Your Cart Is Empty')
        : CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    CartViewHeader(
                      countItems: context
                          .read<CartItemCubit>()
                          .cartEntity
                          .cartItems
                          .length,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              CartViewListView(
                cartEntity: context.read<CartItemCubit>().cartEntity,
              ),
              CartViewPaymentSummary(
                cartTotal: context
                    .watch<CartItemCubit>()
                    .cartEntity
                    .totalAmount()
                    .toInt(),
                discountTotal: context
                    .watch<CartItemCubit>()
                    .cartEntity
                    .totalCartDiscount()
                    .toInt(),
                totalAmount: context
                    .watch<CartItemCubit>()
                    .cartEntity
                    .totalAmount()
                    .toInt(),
              ),
            ],
          );
  }
}
