import 'package:flutter/material.dart';

import 'cart_view_head.dart';
import 'cart_view_listview.dart';
import 'cart_view_payment_summary.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CartViewHeader(
                countItems: 1,
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        CartViewListView(),
        CartViewPaymentSummary(
          cartTotal: 40,
          discountTotal: 60,
          totalAmount: 40,
        ),
      ],
    );
  }
}
