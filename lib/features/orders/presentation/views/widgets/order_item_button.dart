import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';
import 'package:ecommerce_app/features/orders/domin/repo/orders_repo.dart';
import 'package:ecommerce_app/features/orders/presentation/cubits/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/views/widgets/cancel_order_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';

class OrderItemButton extends StatelessWidget {
  const OrderItemButton({
    super.key,
    required this.orderItemEntity,
  });
  final OrderItemEntity orderItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CancelOrderCubit(getIt<OrdersRepo>()),
      child: BlocBuilder<CancelOrderCubit, CancelOrderState>(
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width * .30,
            child: orderItemEntity.status == 'New' ||
                    orderItemEntity.status == 'جديد'
                ? CancelOrderButton(
                    orderItemEntity: orderItemEntity,
                    isLoading: state is CancelOrderLoading ? true : false,
                  )
                : CustomButton(
                    text: 'Get Help',
                    backgroundColor: Colors.white,
                    radius: 32,
                    onPressed: () {},
                  ),
          );
        },
      ),
    );
  }
}
