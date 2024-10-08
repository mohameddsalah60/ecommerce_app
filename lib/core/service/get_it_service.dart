import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/service/api_service.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<EcommerceApiService>(
    EcommerceApiService(
      apiService: getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      ecommerceApiService: getIt<EcommerceApiService>(),
    ),
  );
}
