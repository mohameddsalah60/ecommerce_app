import 'package:ecommerce_app/core/helper_functions/get_addresses_user.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/orders/presentation/views/widgets/order_detils_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/get_it_service.dart';
import '../../../../core/widgets/custom_skeletonizer_loading.dart';
import '../../domin/entites/order_item_entity.dart';
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
            return CustomSkeletonizerLoading(
              isLoading: state is GetOrderDetilsLoading ? true : false,
              child: OrderDetilsViewBody(
                orderItemEntity: OrderItemEntity(
                    id: 0,
                    total: 0,
                    date: '22 / 03 / 2025',
                    status: 'New',
                    cost: 0,
                    discount: 0,
                    points: 0,
                    vat: 0,
                    paymentMethod: 'cash',
                    pointsCommission: 0,
                    addressEntity: getAddresses(),
                    products: []),
              ),
            );
          }
        },
      ),
    );
  }
}
