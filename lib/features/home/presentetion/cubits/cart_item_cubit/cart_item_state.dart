part of 'cart_item_cubit.dart';

class CartItemState {}

final class CartItemInitial extends CartItemState {}

final class CartItemLoading extends CartItemState {}

final class CartItemAdded extends CartItemState {
  final CartItemEntity cartItemEntity;

  CartItemAdded({required this.cartItemEntity});
}

final class CartItemRemoved extends CartItemState {
  final CartItemEntity cartItemEntity;

  CartItemRemoved({required this.cartItemEntity});
}

final class CartItemFailure extends CartItemState {
  final String message;

  CartItemFailure({required this.message});
}

final class UpdateQuantityProduct extends CartItemState {}

final class FetchAllProductsInCartSuccsses extends CartItemState {
  final CartEntity cartEntity;

  FetchAllProductsInCartSuccsses({required this.cartEntity});
}

final class FetchAllProductsInCartFailure extends CartItemState {
  final String message;

  FetchAllProductsInCartFailure({required this.message});
}

final class CartIsEmpty extends CartItemState {}
