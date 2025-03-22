part of 'serach_product_cubit.dart';

sealed class SerachProductState {}

final class SerachProductInitial extends SerachProductState {}

final class SerachProductLoading extends SerachProductState {}

final class SerachProductFailure extends SerachProductState {
  final String message;

  SerachProductFailure({required this.message});
}

final class SerachProductSuccess extends SerachProductState {
  final List<ProductEntity> products;

  SerachProductSuccess({required this.products});
}

final class SerachProductIsEmpty extends SerachProductState {}
