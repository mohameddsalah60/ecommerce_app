import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/home/domin/entites/banners_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domin/repos/home_repo.dart';
import '../models/banners_model.dart';

class HomeRepoImpl implements HomeRepo {
  final EcommerceApiService ecommerceApiService;

  HomeRepoImpl({required this.ecommerceApiService});
  @override
  Future<Either<Failure, List<CategoriesModel>>> getCategories(
      {int? id}) async {
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

  @override
  Future<Either<Failure, List<BannersEntity>>> getBanners() async {
    try {
      var response = await ecommerceApiService.getBanners();
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      } else {
        List<BannersModel> banners = [];

        for (var banner in response['data']) {
          banners.add(BannersModel.fromJsonData(banner));
        }

        return right(banners);
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
