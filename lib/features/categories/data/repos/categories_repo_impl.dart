import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:ecommerce_app/core/entites/product_entity.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domin/repo/categories_repo.dart';
import '../models/categories_model.dart';

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

  @override
  Future<Either<Failure, List<CategoriesModel>>> getCategories() async {
    try {
      var response = await ecommerceApiService.getCategories();
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      } else {
        List<CategoriesModel> categories = [];
        for (var category in response['data']['data']) {
          categories.add(CategoriesModel.fromJsonData(category));
        }
        return right(categories);
      }
    } on DioException catch (e) {
      log('DioException in HomeRepoImpl : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in HomeRepoImpl : ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in HomeRepoImpl: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }
}
