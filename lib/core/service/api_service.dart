import 'package:dio/dio.dart';

class ApiService {
  final String _baseLink = 'https://student.valuxapps.com/api/';
  final Dio dio;
  final options = Options(
    headers: {
      'lang': 'en',
    },
  );

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required endPoint}) async {
    final response = await dio.get(
      '$_baseLink$endPoint',
      options: options,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Object? data,
  }) async {
    final response = await dio.post(
      '$_baseLink$endPoint',
      data: data,
      options: options,
    );

    final responseData = response.data;

    return responseData;
  }
}
