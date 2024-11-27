import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/core/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());
  final ProductRepo productRepo;
  fetchAllProducts() async {
    emit(ProductLoading());
    var result = await productRepo.fetchAllProducts(isOffers: true);
    result.fold(
      (failure) => emit(
        ProductFailure(
          message: failure.errorMessage,
        ),
      ),
      (products) => emit(
        ProductSuccsess(products: products),
      ),
    );
  }

  passProductDetails(ProductEntity product) {
    emit(PassProductDetails(product: product));
  }
}
