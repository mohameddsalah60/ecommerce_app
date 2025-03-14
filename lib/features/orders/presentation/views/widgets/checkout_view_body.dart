import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentetion/cubits/cart_item_cubit/cart_item_cubit.dart';
import '../../../../home/presentetion/views/widgets/cart_view_payment_summary.dart';
import 'checkout_address.dart';
import 'checkout_delivery.dart';
import 'checkout_selected_payment.dart';
import 'checkout_voucher.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                CheckoutSelectedAddress(),
                SizedBox(
                  height: 24,
                ),
                CheckoutDelivery(),
                SizedBox(
                  height: 24,
                ),
                CheckoutSelectedPayment(),
                SizedBox(
                  height: 24,
                ),
                CheckoutVoucher(),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
        CartViewPaymentSummary(
          cartTotal:
              context.watch<CartItemCubit>().cartEntity.totalAmount().toInt(),
          discountTotal: context
              .watch<CartItemCubit>()
              .cartEntity
              .totalCartDiscount()
              .toInt(),
          totalAmount:
              context.watch<CartItemCubit>().cartEntity.totalAmount().toInt(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        )
      ],
    );
  }
}
