part of 'add_new_order_cubit.dart';

class AddNewOrderState {}

final class AddNewOrderInitial extends AddNewOrderState {}

final class AddNewOrderLoading extends AddNewOrderState {}

final class AddNewOrderSuccsess extends AddNewOrderState {
  final int orderId;

  AddNewOrderSuccsess({required this.orderId});
}

final class AddNewOrderFailure extends AddNewOrderState {
  final String message;

  AddNewOrderFailure({required this.message});
}
