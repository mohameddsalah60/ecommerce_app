import 'package:ecommerce_app/features/home/domin/entites/categories_entity.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  Future<void> getCategories({int? id}) async {
    emit(CategoriesLoading());
    var result = await homeRepo.getCategories();
    result.fold(
      (failure) => emit(CategoriesFailure(message: failure.errorMessage)),
      (categories) => emit(
        CategoriesSuccsess(categories: categories),
      ),
    );
  }
}
