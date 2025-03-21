import 'package:ecommerce_app/features/orders/presentation/cubits/get_order_detils_cubit/get_order_detils_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/custom_snack_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../domin/entites/order_item_entity.dart';
import '../../cubits/cancel_order_cubit/cancel_order_cubit.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton({
    super.key,
    required this.orderItemEntity,
    required this.isLoading,
  });
  final bool isLoading;
  final OrderItemEntity orderItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CancelOrderCubit, CancelOrderState>(
        listener: (context, state) {
          if (state is CancelOrderSuccess) {
            try {
              context.read<GetOrdersCubit>().updateStatus(orderItemEntity);
            } catch (e) {
              try {
                context
                    .read<GetOrderDetilsCubit>()
                    .updateStatus(orderItemEntity);
              } catch (e) {
                debugPrint("No matching cubit found in context");
              }
            }

            customSnackBar(context,
                text: 'Order ID : ${orderItemEntity.id} Cancelled Success',
                color: Colors.green);
          } else if (state is CancelOrderFailure) {
            customSnackBar(context, text: state.message);
          }
        },
        child: CustomButton(
          isLoading: isLoading,
          text: 'Cancel Order',
          backgroundColor: Colors.white,
          onPressed: () {
            if (orderItemEntity.status == 'New' ||
                orderItemEntity.status == 'جديد') {
              context
                  .read<CancelOrderCubit>()
                  .cancelOrderUser(iD: orderItemEntity.id);
            }
          },
        ));
  }
}
