import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:ecommerce_app/core/entites/product_entity.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domin/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final EcommerceApiService ecommerceApiService;

  CategoriesRepoImpl({required this.ecommerceApiService});
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchAllProductsByCategoryId(
      {required int categoryId}) async {
    try {
      var response = await ecommerceApiService.fetchAllProductsByCategoryId(
        categoryId: categoryId,
      );
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      } else {
        List<ProductModel> products = [];

        for (var product in response['data']['data']) {
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
}
