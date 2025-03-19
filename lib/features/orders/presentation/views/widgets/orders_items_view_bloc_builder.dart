import 'package:ecommerce_app/core/widgets/custom_text_and_loading.dart';
import 'package:ecommerce_app/core/widgets/your_data_is_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/get_orders_cubit/get_orders_cubit.dart';
import 'orders_items_view_body.dart';

class OrdersItemsViewBlocBuilder extends StatelessWidget {
  const OrdersItemsViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersSuccsess) {
          if (state.orders.isNotEmpty) {
            return OrdersItemsViewBody(orders: state.orders);
          } else {
            return const YourDataIsEmpty(
                text: "You haven't requested any orders yet");
          }
        } else if (state is GetOrdersFailure) {
          return Center(child: Text(state.message));
        } else {
          return const CustomTextAndLoading();
        }
      },
    );
  }
}
