import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/domain/entites/user_entite.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
    String phone,
  );
  Future<Either<Failure, UserEntity>> loginUserWithEmailAndPassword(
    String email,
    String password,
  );

  Future<void> saveUserData({required UserEntity userEntity});
}
