import 'package:ecommerce_app/features/orders/domin/repo/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cancel_order_state.dart';

class CancelOrderCubit extends Cubit<CancelOrderState> {
  CancelOrderCubit(this.ordersRepo) : super(CancelOrderInitial());
  final OrdersRepo ordersRepo;
  Future<void> cancelOrderUser({required int iD}) async {
    emit(CancelOrderLoading());
    var result = await ordersRepo.cancelOrderUser(iD: iD);
    result.fold(
      (failure) {
        emit(CancelOrderFailure(message: failure.errorMessage));
      },
      (order) {
        emit(CancelOrderSuccess());
      },
    );
  }
}
