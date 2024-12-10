part of 'categories_details_cubit.dart';

class CategoriesDetailsState {}

final class CategoriesInitial extends CategoriesDetailsState {}

final class CategoriesLoading extends CategoriesDetailsState {}

final class CategoriesSuccsess extends CategoriesDetailsState {
  final List<ProductEntity> products;

  CategoriesSuccsess({required this.products});
}

final class CategoriesFailure extends CategoriesDetailsState {
  final String message;

  CategoriesFailure({required this.message});
}
