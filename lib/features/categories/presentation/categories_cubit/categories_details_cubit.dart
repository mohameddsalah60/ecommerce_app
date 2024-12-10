import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/features/categories/domin/categories_repo.dart';

part 'categories_details_state.dart';

class CategoriesDetailsCubit extends Cubit<CategoriesDetailsState> {
  CategoriesDetailsCubit(this.categoriesRepo) : super(CategoriesInitial());
  final CategoriesRepo categoriesRepo;
  fetchAllProductsByCategoryId({required int categoryId}) async {
    emit(CategoriesLoading());
    var result = await categoriesRepo.fetchAllProductsByCategoryId(
        categoryId: categoryId);
    result.fold(
      (failure) => emit(
        CategoriesFailure(
          message: failure.errorMessage,
        ),
      ),
      (products) => emit(
        CategoriesSuccsess(products: products),
      ),
    );
  }
}
