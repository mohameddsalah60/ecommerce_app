import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/orders_items_view_body.dart';

class OrdersItemsView extends StatelessWidget {
  const OrdersItemsView({super.key});
  static const routeName = 'ordersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'My Orders'),
      body: const SafeArea(child: OrdersItemsViewBody()),
    );
  }
}
