import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/repo/orders_repo.dart';

part 'get_order_detils_state.dart';

class GetOrderDetilsCubit extends Cubit<GetOrderDetilsState> {
  GetOrderDetilsCubit(this.ordersRepo) : super(GetOrderDetilsInitial());
  final OrdersRepo ordersRepo;
  Future<void> getOrderDetilsUser({required int iD}) async {
    emit(GetOrderDetilsLoading());
    var result = await ordersRepo.getOrderDetilsUser(
      iD: iD,
    );
    result.fold(
      (failure) => emit(GetOrderDetilsFailure(message: failure.errorMessage)),
      (order) {
        emit(GetOrderDetilsSuccess(orderItemEntity: order));
      },
    );
  }
}
