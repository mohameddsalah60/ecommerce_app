import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entites/user_entite.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final EcommerceApiService ecommerceApiService;

  AuthRepoImpl({required this.ecommerceApiService});

  @override
  Future<Either<Failure, UserEntite>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    try {
      var response = await ecommerceApiService.createUserWithEmailAndPassword(
        email,
        password,
        name,
        phone,
      );

      final data = response['data'];

      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      }

      return right(UserModel.fromJsonData(data));
    } on DioException catch (e) {
      log('DioException in AuthRepoImpl : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in AuthRepoImpl : ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }

  @override
  Future<Either<Failure, UserEntite>> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var response = await ecommerceApiService.loginUserWithEmailAndPassword(
        email,
        password,
      );

      final data = response['data'];

      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      }

      return right(UserModel.fromJsonData(data));
    } on DioException catch (e) {
      log('DioException in AuthRepoImpl : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in AuthRepoImpl : ${e.toString()}');
      if (e.message ==
          'This credentials does not meet any of our records, please make sure you have entered the right credentials') {
        return left(
          ServerFailure('Login failed. Verify your credentials and try again.'),
        );
      } else {
        return left(ServerFailure(e.message));
      }
    } catch (e) {
      log('Exception in AuthRepoImpl: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }
}
