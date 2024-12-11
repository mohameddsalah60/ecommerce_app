import 'package:ecommerce_app/features/categories/domin/entites/categories_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domin/repo/categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());
  final CategoriesRepo categoriesRepo;
  Future<void> getCategories({int? id}) async {
    emit(CategoriesLoading());
    var result = await categoriesRepo.getCategories();
    result.fold(
      (failure) => emit(CategoriesFailure(message: failure.errorMessage)),
      (categories) => emit(
        CategoriesSuccsess(categories: categories),
      ),
    );
  }
}
