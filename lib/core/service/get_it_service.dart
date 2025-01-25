import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/repos/product_repo.dart';
import 'package:ecommerce_app/core/repos/product_repo_impl.dart';
import 'package:ecommerce_app/core/service/api_service.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';
import 'package:ecommerce_app/features/addresses/data/repos/addresses_repo_impl.dart';
import 'package:ecommerce_app/features/addresses/data/services/location_service.dart';
import 'package:ecommerce_app/features/addresses/data/services/open_street_map_service.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommerce_app/features/categories/domin/repo/categories_repo.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';

import 'package:get_it/get_it.dart';

import '../../features/categories/data/repos/categories_repo_impl.dart';
import '../../features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<LocationService>(OpenStreetMapService());
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
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      ecommerceApiService: getIt<EcommerceApiService>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      ecommerceApiService: getIt<EcommerceApiService>(),
    ),
  );
  getIt.registerSingleton<CategoriesRepo>(
    CategoriesRepoImpl(
      ecommerceApiService: getIt<EcommerceApiService>(),
    ),
  );
  getIt.registerSingleton<AddressesRepo>(
    AddressesRepoImpl(
      locationService: getIt<OpenStreetMapService>(),
    ),
  );
}
