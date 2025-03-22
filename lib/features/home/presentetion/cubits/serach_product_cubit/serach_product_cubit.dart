import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

part 'serach_product_state.dart';

class SerachProductCubit extends Cubit<SerachProductState> {
  SerachProductCubit(this.homeRepo) : super(SerachProductInitial());
  final Debouncer debouncer = Debouncer();
  final HomeRepo homeRepo;
  Future<void> searchProducts({required String text}) async {
    emit(SerachProductLoading());
    var result = await homeRepo.searchProducts(text: text);
    result.fold(
      (failure) => emit(SerachProductFailure(message: failure.errorMessage)),
      (products) => products.isNotEmpty
          ? emit(SerachProductSuccess(products: products))
          : emit(SerachProductIsEmpty()),
    );
  }

  void textFieldChange(String value) {
    const duration = Duration(milliseconds: 4000);
    debouncer.debounce(
      duration: duration,
      onDebounce: () async {
        if (value.isNotEmpty || value != '') {
          await searchProducts(text: value);
        } else {
          emit(SerachProductIsEmpty());
        }
      },
    );
  }
}
