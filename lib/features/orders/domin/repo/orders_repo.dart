import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';

import '../../data/models/order_item_model.dart';
import '../entites/order_item_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, OrderItemModel>> addNewOrderUser({
    required int addressID,
    required int paymentMethod,
    required bool usePoints,
  });
  Future<Either<Failure, List<OrderItemEntity>>> getOrdersUser();
  Future<Either<Failure, OrderItemModel>> getOrderDetilsUser({required int iD});
  Future<Either<Failure, void>> cancelOrderUser({required int iD});
}
