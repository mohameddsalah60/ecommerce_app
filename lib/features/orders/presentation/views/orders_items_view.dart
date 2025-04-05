import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/features/orders/domin/repo/orders_repo.dart';
import 'package:ecommerce_app/features/orders/presentation/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/orders_items_view_bloc_builder.dart';

class OrdersItemsView extends StatelessWidget {
  const OrdersItemsView({super.key});
  static const routeName = 'ordersView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOrdersCubit(getIt<OrdersRepo>())..getOrders(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'My Orders',
          onTap: () {
            Navigator.maybePop(context);
          },
        ),
        body: const SafeArea(child: OrdersItemsViewBlocBuilder()),
      ),
    );
  }
}
