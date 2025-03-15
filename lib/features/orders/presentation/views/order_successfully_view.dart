import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/order_successfully_view_body.dart';

class OrderSuccessfullyView extends StatelessWidget {
  const OrderSuccessfullyView({super.key, required this.orderId});
  static const String routeName = 'OrderSuccessfully';
  final int orderId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'ID #$orderId',
        onTap: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(child: OrderSuccessfullyViewBody(orderId: orderId)),
    );
  }
}
