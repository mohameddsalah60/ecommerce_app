import 'package:ecommerce_app/features/auth/domain/entites/user_entite.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.phone,
    required super.email,
    required super.token,
    required super.image,
    required super.id,
    required super.points,
    required super.credit,
  });
  factory UserModel.fromJsonData(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] as String? ?? '',
      phone: data['phone'] as String? ?? '',
      email: data['email'] as String? ?? '',
      image: data['image'] as String? ?? '',
      token: data['token'] as String? ?? '',
      id: data['id'] as num? ?? 0,
      credit: data['credit'] as num? ?? 0,
      points: (data['points'] as num?) ?? 0,
    );
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      phone: userEntity.phone,
      email: userEntity.email,
      token: userEntity.token,
      image: userEntity.image,
      id: userEntity.id,
      points: userEntity.points,
      credit: userEntity.credit,
    );
  }
  toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'token': token,
      'image': image,
      'id': id,
      'points': points,
      'credit': credit,
    };
  }
}
