import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_text_and_loading.dart';
import 'package:ecommerce_app/features/orders/presentation/views/widgets/order_detils_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/get_it_service.dart';
import '../../domin/repo/orders_repo.dart';
import '../cubits/get_order_detils_cubit/get_order_detils_cubit.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.iD});
  static const String routeName = 'order-detils';
  final int iD;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Order Details',
        onTap: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: OrderDetilsViewBlocBuilder(
          iD: iD,
        ),
      ),
    );
  }
}

class OrderDetilsViewBlocBuilder extends StatelessWidget {
  const OrderDetilsViewBlocBuilder({super.key, required this.iD});
  final int iD;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetOrderDetilsCubit(getIt<OrdersRepo>())..getOrderDetilsUser(iD: iD),
      child: BlocBuilder<GetOrderDetilsCubit, GetOrderDetilsState>(
        builder: (context, state) {
          if (state is GetOrderDetilsSuccess) {
            return OrderDetilsViewBody(
              orderItemEntity: state.orderItemEntity,
            );
          } else {
            return const CustomTextAndLoading();
          }
        },
      ),
    );
  }
}
