import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';

abstract class OrdersRepo {
  Future<Either<Failure, int>> addNewOrderUser({
    required int addressID,
    required int paymentMethod,
    required bool usePoints,
  });
}
