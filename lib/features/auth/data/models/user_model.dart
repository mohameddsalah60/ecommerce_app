import 'package:ecommerce_app/features/auth/domain/entites/user_entite.dart';

class UserModel extends UserEntite {
  UserModel(
      {required super.name,
      required super.phone,
      required super.email,
      required super.tokin});
  factory UserModel.fromJsonData(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] as String,
      phone: data['phone'] as String,
      email: data['email'] as String,
      tokin: data['token'] as String,
    );
  }
}
