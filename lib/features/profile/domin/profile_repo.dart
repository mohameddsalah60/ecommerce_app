import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> personalInformationUpdate({
    required String name,
    required String email,
    required String phone,
  });
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Either<Failure, void>> logoutUser();
}
