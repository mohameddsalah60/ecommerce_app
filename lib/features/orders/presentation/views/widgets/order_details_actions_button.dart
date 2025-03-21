import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';
import 'package:ecommerce_app/features/orders/domin/repo/orders_repo.dart';
import 'package:ecommerce_app/features/orders/presentation/cubits/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_details_actions_button_bloc_builder.dart';

class OrderDetailsActionsButton extends StatelessWidget {
  const OrderDetailsActionsButton({
    super.key,
    required this.orderItemEntity,
  });
  final OrderItemEntity orderItemEntity;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) => CancelOrderCubit(getIt<OrdersRepo>()),
        child: OrderDetailsActionsButtonBlocBuilder(
          orderItemEntity: orderItemEntity,
        ),
      ),
    );
  }
}
