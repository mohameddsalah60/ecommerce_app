import 'dart:convert';

import 'package:ecommerce_app/core/service/shared_preferences_service.dart';
import 'package:ecommerce_app/features/auth/domain/entites/user_entite.dart';

import '../../features/auth/data/models/user_model.dart';

UserEntity getUser() {
  var jsonData = SharedPreferencesService.getData(key: 'userData');
  var userEntity = UserModel.fromJsonData(jsonDecode(jsonData));
  return userEntity;
}