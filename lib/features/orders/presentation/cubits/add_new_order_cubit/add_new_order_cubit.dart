import 'package:ecommerce_app/features/orders/domin/repo/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_new_order_state.dart';

class AddNewOrderCubit extends Cubit<AddNewOrderState> {
  AddNewOrderCubit(this.ordersRepo) : super(AddNewOrderInitial());
  final OrdersRepo ordersRepo;
  int paymentMethod = 1;

  Future<void> addNewOrderUser(
      {required int addressID, required bool usePoints}) async {
    emit(AddNewOrderLoading());
    var result = await ordersRepo.addNewOrderUser(
        addressID: addressID,
        paymentMethod: paymentMethod,
        usePoints: usePoints);
    result.fold(
      (failure) => emit(AddNewOrderFailure(message: failure.errorMessage)),
      (id) {
        emit(AddNewOrderSuccsess(orderId: id));
      },
    );
  }
}
