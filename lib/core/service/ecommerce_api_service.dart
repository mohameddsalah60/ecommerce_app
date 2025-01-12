import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/helper_functions/get_user.dart';
import 'package:ecommerce_app/core/service/api_service.dart';

class EcommerceApiService {
  final ApiService apiService;

  EcommerceApiService({required this.apiService});

  Future<Map<String, dynamic>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    try {
      var data = await apiService.post(
        endPoint: 'register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var data = await apiService.post(
        endPoint: 'login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCategories() async {
    try {
      var data = await apiService.get(
        endPoint: 'categories',
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getBanners() async {
    try {
      var data = await apiService.get(
        endPoint: 'banners',
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchAllProductsByCategoryId(
      {required int categoryId}) async {
    try {
      var data = await apiService.get(
        endPoint: 'products',
        endPoint2: '?category_id=',
        id: categoryId,
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchAllProducts() async {
    try {
      var data = await apiService.get(
        endPoint: 'products',
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> cartItemState({required int productId}) async {
    try {
      var data = await apiService.post(
        endPoint: 'carts?product_id=$productId',
        headers: Options(
          headers: {
            'lang': 'en',
            'Authorization': getUser().token,
          },
        ),
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
