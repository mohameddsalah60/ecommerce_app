import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/orders/data/models/order_item_model.dart';
import 'package:ecommerce_app/features/orders/domin/repo/orders_repo.dart';

import '../../../../core/service/ecommerce_api_service.dart';
import '../../domin/entites/order_item_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final EcommerceApiService ecommerceApiService;
  OrdersRepoImpl({required this.ecommerceApiService});
  @override
  Future<Either<Failure, OrderItemModel>> addNewOrderUser(
      {required int addressID,
      required int paymentMethod,
      required bool usePoints}) async {
    try {
      var response = await ecommerceApiService.addNewOrderUser(
          addressID, paymentMethod, usePoints);
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      }

      return right(OrderItemModel.fromJson(response["data"]));
    } on DioException catch (e) {
      log('DioException in OrdersRepo : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in OrdersRepo : ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in OrdersRepo: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }

  @override
  Future<Either<Failure, List<OrderItemEntity>>> getOrdersUser() async {
    try {
      var response = await ecommerceApiService.getOrdersUser();
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      }

      List<OrderItemEntity> orders = (response['data']['data'] as List<dynamic>)
          .map<OrderItemEntity>((e) => OrderItemModel.fromJson(e))
          .toList();

      return right(orders);
    } on DioException catch (e) {
      log('DioException in OrdersRepo : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in OrdersRepo : ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in OrdersRepo: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }

  @override
  Future<Either<Failure, OrderItemModel>> getOrderDetilsUser(
      {required int iD}) async {
    try {
      var response = await ecommerceApiService.getOrderDetilsUser(iD: iD);
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      }

      return right(OrderItemModel.fromJson(response["data"]));
    } on DioException catch (e) {
      log('DioException in OrdersRepo : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in OrdersRepo : ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in OrdersRepo: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }
}
