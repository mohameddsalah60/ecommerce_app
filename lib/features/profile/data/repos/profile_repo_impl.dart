import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';
import 'package:ecommerce_app/core/service/shared_preferences_service.dart';

import '../../../../constantis.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../auth/data/models/user_model.dart';
import '../../domin/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final EcommerceApiService ecommerceApiService;

  ProfileRepoImpl({required this.ecommerceApiService});
  @override
  Future<Either<Failure, void>> personalInformationUpdate(
      {required String name,
      required String email,
      required String phone}) async {
    try {
      var response = await ecommerceApiService.personalInformationUpdate(
          name: name, email: email, phone: phone);
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      }
      UserModel user = UserModel.fromJsonData(response['data']);
      var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());

      await SharedPreferencesService.put(key: kUserDataCache, value: jsonData);

      return right(null);
    } on DioException catch (e) {
      log('DioException in ProfileRepoImpl : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in ProfileRepoImpl : ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in ProfileRepoImpl: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      var response = await ecommerceApiService.changePassword(
          currentPassword: currentPassword, newPassword: newPassword);
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      }

      return right(null);
    } on DioException catch (e) {
      log('DioException in ProfileRepoImpl : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in ProfileRepoImpl : ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in ProfileRepoImpl: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }
}
