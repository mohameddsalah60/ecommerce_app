import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/helper_functions/get_user.dart';
import 'package:ecommerce_app/core/service/api_service.dart';
import 'package:ecommerce_app/features/addresses/data/models/address_model.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';

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

  Future<Map<String, dynamic>> addOrRemoveProductToCart(
      {required int productId}) async {
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

  Future<Map<String, dynamic>> updateQuantityProductInCart(
      {required int cartIdProduct, required int newQuantity}) async {
    try {
      var data = await apiService.put(
        endPoint: 'carts/$cartIdProduct?quantity=$newQuantity',
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

  Future<Map<String, dynamic>> getItemsCart() async {
    try {
      var data = await apiService.get(
        endPoint: 'carts',
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

  Future<Map<String, dynamic>> addNewAddressUser({
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
    required double latitude,
    required double longitude,
  }) async {
    try {
      var data = await apiService.post(
        endPoint: 'addresses',
        data: {
          'name': name,
          'city': city,
          'region': region,
          'details': details,
          'notes': notes,
          'latitude': latitude,
          'longitude': longitude,
        },
        headers: Options(
          headers: {
            'Authorization': getUser().token,
          },
        ),
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAddressesUser() async {
    try {
      var data = await apiService.get(
        endPoint: 'addresses',
        headers: Options(
          headers: {
            'Authorization': getUser().token,
          },
        ),
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateAddressUser(
      {required AddressEntity address}) async {
    try {
      var data = await apiService.put(
        endPoint: 'addresses/${address.id}',
        data: AddressModel.fromEntity(addressEntity: address).toMap(),
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

  Future<Map<String, dynamic>> deleteAddressUser({required int id}) async {
    try {
      var data = await apiService.delete(
        endPoint: 'addresses/$id',
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

  Future<Map<String, dynamic>> addNewOrderUser(
    int addressID,
    int paymentMethod,
    bool usePoints,
  ) async {
    try {
      var data = await apiService.post(
        endPoint: 'orders',
        data: {
          'address_id': addressID,
          'payment_method': paymentMethod,
          'use_points': usePoints,
        },
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

  Future<Map<String, dynamic>> getOrdersUser() async {
    try {
      var data = await apiService.get(
        endPoint: 'orders',
        headers: Options(
          headers: {
            'Authorization': getUser().token,
          },
        ),
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getOrderDetilsUser({required int iD}) async {
    try {
      var data = await apiService.get(
        endPoint: 'orders/$iD',
        headers: Options(
          headers: {
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
