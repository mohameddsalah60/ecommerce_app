part of 'categories_details_cubit.dart';

class CategoriesDetailsState {}

final class CategoriesInitial extends CategoriesDetailsState {}

final class CategoriesDetailsLoading extends CategoriesDetailsState {}

final class CategoriesDetailsSuccsess extends CategoriesDetailsState {
  final List<ProductEntity> products;

  CategoriesDetailsSuccsess({required this.products});
}

final class CategoriesDetailsFailure extends CategoriesDetailsState {
  final String message;

  CategoriesDetailsFailure({required this.message});
}
