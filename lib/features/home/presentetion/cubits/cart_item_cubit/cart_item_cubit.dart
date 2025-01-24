import 'package:ecommerce_app/features/home/domin/entites/cart_entity.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/entites/car_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit(this.homeRepo) : super(CartItemInitial());

  final HomeRepo homeRepo;
  CartEntity cartEntity = CartEntity(cartItems: []);
  addOrRemoveProductToCart({required int productId}) async {
    emit(CartItemLoading());
    var result = await homeRepo.addOrRemoveProductToCart(productId: productId);
    result.fold(
      (failure) {
        emit(CartItemFailure(message: failure.errorMessage));
      },
      (cartItem) {
        bool isProductExist = cartEntity.isExis(cartItem.productEntity.id);
        if (isProductExist) {
          cartEntity.removeCarItemById(cartItem.productEntity.id);
          cartEntity.total = cartEntity.total! - cartItem.productEntity.price;
          emit(CartItemRemoved(cartItemEntity: cartItem));
        } else {
          cartEntity.addCartItem(cartItem);
          cartEntity.total = cartEntity.total! + cartItem.productEntity.price;
          emit(CartItemAdded(cartItemEntity: cartItem));
        }
      },
    );
  }

  void updateQuantityProduct(
      {required int cartIdProduct, required int newQuantity}) async {
    emit(CartItemLoading());
    var result = await homeRepo.updateQuantityProductInCart(
        cartIdProduct: cartIdProduct, newQuantity: newQuantity);
    result.fold(
      (failure) {
        emit(CartItemFailure(message: failure.errorMessage));
      },
      (cartItem) {
        cartEntity.total = cartEntity.total! + cartItem.productEntity.price;
        emit(UpdateQuantityProduct());
      },
    );
  }

  void fetchAllProductsInCart() async {
    emit(CartItemLoading());
    var result = await homeRepo.getItemsCart();
    result.fold(
      (failure) {
        emit(CartItemFailure(message: failure.errorMessage));
        emit(FetchAllProductsInCartFailure(message: failure.errorMessage));
      },
      (cartItem) {
        cartEntity = cartItem;
        cartEntity.total = cartItem.total!;
        emit(FetchAllProductsInCartSuccsses(cartEntity: cartEntity));
      },
    );
  }
}
