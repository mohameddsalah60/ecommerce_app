import 'package:ecommerce_app/features/orders/presentation/cubits/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/views/widgets/order_agein_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/entites/order_item_entity.dart';
import 'cancel_order_button.dart';

class OrderDetailsActionsButtonBlocBuilder extends StatelessWidget {
  const OrderDetailsActionsButtonBlocBuilder({
    super.key,
    required this.orderItemEntity,
  });

  final OrderItemEntity orderItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CancelOrderCubit, CancelOrderState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child:
            orderItemEntity.status == 'New' || orderItemEntity.status == 'جديد'
                ? CancelOrderButton(
                    orderItemEntity: orderItemEntity,
                    isLoading: state is CancelOrderLoading ? true : false,
                  )
                : OrderAgeinButton(orderItemEntity: orderItemEntity),
      ),
    );
  }
}
