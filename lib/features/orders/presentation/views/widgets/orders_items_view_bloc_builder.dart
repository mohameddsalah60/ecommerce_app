import 'package:ecommerce_app/core/widgets/your_data_is_empty.dart';
import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_skeletonizer_loading.dart';
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
          return CustomSkeletonizerLoading(
              isLoading: state is GetOrdersSuccsess ? true : false,
              child: OrdersItemsViewBody(
                orders: List.generate(
                    10,
                    (index) => OrderItemEntity(
                        id: 0,
                        total: 0,
                        date: '22 / 03 / 2025',
                        status: 'New')),
              ));
        }
      },
    );
  }
}
