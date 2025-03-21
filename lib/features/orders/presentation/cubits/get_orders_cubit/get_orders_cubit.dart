import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';
import 'package:ecommerce_app/features/orders/domin/repo/orders_repo.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.ordersRepo) : super(GetOrdersInitial());
  final OrdersRepo ordersRepo;
  Timer? _pollingTimer;
  List<OrderItemEntity> savedOrders = [];

  void startPolling() {
    _pollingTimer = Timer.periodic(
        const Duration(
          seconds: 10,
        ), (_) async {
      await getOrders();
    });
  }

  void stopPolling() {
    _pollingTimer?.cancel();
  }

  Future<void> getOrders() async {
    if (savedOrders.isEmpty) {
      emit(GetOrdersLoading());
      startPolling();
    }

    var result = await ordersRepo.getOrdersUser();
    result.fold(
      (failure) => emit(GetOrdersFailure(message: failure.errorMessage)),
      (orders) {
        if (_hasChanges(orders)) {
          savedOrders = orders;
          emit(GetOrdersSuccsess(orders: savedOrders));
        }
      },
    );
  }

  bool _hasChanges(List<OrderItemEntity> newOrders) {
    if (newOrders.length != savedOrders.length) {
      return true;
    }

    for (int i = 0; i < newOrders.length; i++) {
      if (newOrders[i].status != savedOrders[i].status) {
        return true;
      }
    }

    return false;
  }

  @override
  Future<void> close() {
    stopPolling();
    return super.close();
  }

  updateStatus(OrderItemEntity updatedOrder) {
    updatedOrder.status = 'Cancelled';
    savedOrders = savedOrders.map((order) {
      return order.id == updatedOrder.id ? updatedOrder : order;
    }).toList();

    emit(GetOrdersSuccsess(orders: savedOrders));
  }
}
