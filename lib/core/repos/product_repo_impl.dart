import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/repos/product_repo.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';

import '../errors/exceptions.dart';

class ProductRepoImpl implements ProductRepo {
  final EcommerceApiService ecommerceApiService;

  ProductRepoImpl({required this.ecommerceApiService});
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchAllProductsByCategoryId(
      {required String categoryId}) async {
    try {
      var response = await ecommerceApiService.fetchAllProductsByCategoryId(
        categoryId: categoryId,
      );
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      } else {
        List<ProductModel> products = [];

        for (var product in response['data']) {
          products.add(ProductModel.fromJson(product));
        }

        return right(products);
      }
    } on DioException catch (e) {
      log('DioException in ProductRepoImpl : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in ProductRepoImpl : ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in ProductRepoImpl: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts(
      {bool? isOffers}) async {
    try {
      var response = await ecommerceApiService.fetchAllProducts();
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      } else {
        List<ProductModel> products = [];
        var data = response['data']['data'];
        for (var product in data) {
          if (isOffers == true) {
            if (product['discount'] != 0) {
              products.add(ProductModel.fromJson(product));
              products.sort((a, b) => b.discount.compareTo(a.discount));
            }
          } else {
            products.add(ProductModel.fromJson(product));
          }
        }
        return right(products);
      }
    } on DioException catch (e) {
      log('DioException in ProductRepoImpl : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in ProductRepoImpl : ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in ProductRepoImpl: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }
}
