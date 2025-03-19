part of 'get_orders_cubit.dart';

class GetOrdersState {}

final class GetOrdersInitial extends GetOrdersState {}

final class GetOrdersLoading extends GetOrdersState {}

final class GetOrdersFailure extends GetOrdersState {
  final String message;

  GetOrdersFailure({required this.message});
}

final class GetOrdersSuccsess extends GetOrdersState {
  final List<OrderItemEntity> orders;

  GetOrdersSuccsess({required this.orders});
}

final class OrdersIsEmpty extends GetOrdersState {}
