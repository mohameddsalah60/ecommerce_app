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
}
