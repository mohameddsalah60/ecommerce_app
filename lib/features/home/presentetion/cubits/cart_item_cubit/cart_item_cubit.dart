import 'package:ecommerce_app/features/home/domin/entites/cart_entity.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/entites/car_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit(this.homeRepo) : super(CartItemInitial());
  CartItemEntity? cartItemEntity;

  final HomeRepo homeRepo;
  CartEntity cartEntity = CartEntity(cartItems: []);
  addOrRemoveProductToCart({required int productId}) async {
    emit(CartItemLoading());
    var result = await homeRepo.cartItems(productId: productId);
    result.fold(
      (failure) {
        emit(CartItemFailure(message: failure.errorMessage));
      },
      (cartItem) {
        bool isProductExist = cartEntity.isExis(cartItem.productEntity);
        if (isProductExist) {
          cartEntity.removeCarItemById(cartItem.productEntity.id);
          cartItemEntity = cartItem;
          emit(CartItemRemoved(cartItemEntity: cartItem));
        } else {
          cartItem.productEntity.inCart = true;
          cartItemEntity = cartItem;
          cartEntity.addCartItem(cartItem);
          emit(CartItemAdded(cartItemEntity: cartItem));
        }
      },
    );
  }

  void updateQuantityProduct() {
    emit(UpdateQuantityProduct());
  }
}