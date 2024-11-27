part of 'product_cubit.dart';

class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccsess extends ProductState {
  final List<ProductEntity> products;

  ProductSuccsess({required this.products});
}

final class ProductFailure extends ProductState {
  final String message;

  ProductFailure({required this.message});
}

final class PassProductDetails extends ProductState {
  final ProductEntity product;

  PassProductDetails({required this.product});
}
