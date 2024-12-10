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

  Future<Map<String, dynamic>> get(
      {required String endPoint, String? endPoint2, int? id}) async {
    final Response<dynamic> response;
    if (endPoint2 != null) {
      if (id != null) {
        response = await dio.get(
          '$_baseLink$endPoint$endPoint2$id',
          options: options,
        );
      } else {
        response = await dio.get(
          '$_baseLink$endPoint$endPoint2',
          options: options,
        );
      }
    } else {
      response = await dio.get(
        '$_baseLink$endPoint',
        options: options,
      );
    }
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
