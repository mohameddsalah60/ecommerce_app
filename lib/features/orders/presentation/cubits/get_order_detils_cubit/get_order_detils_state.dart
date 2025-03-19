part of 'get_order_detils_cubit.dart';

sealed class GetOrderDetilsState {}

final class GetOrderDetilsInitial extends GetOrderDetilsState {}

final class GetOrderDetilsLoading extends GetOrderDetilsState {}

final class GetOrderDetilsSuccess extends GetOrderDetilsState {
  final OrderItemEntity orderItemEntity;

  GetOrderDetilsSuccess({required this.orderItemEntity});
}

final class GetOrderDetilsFailure extends GetOrderDetilsState {
  final String message;

  GetOrderDetilsFailure({required this.message});
}
