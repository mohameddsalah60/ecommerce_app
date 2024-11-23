part of 'categories_cubit.dart';

class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccsess extends CategoriesState {
  final List<CategoriesEntity> categories;

  CategoriesSuccsess({required this.categories});
}

final class CategoriesFailure extends CategoriesState {
  final String message;

  CategoriesFailure({required this.message});
}
