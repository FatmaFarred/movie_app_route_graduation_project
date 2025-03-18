import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/Api_constant.dart';

@singleton
class ApiManager {
  final dio = Dio();

  Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? headers}) {
    return dio.get(
      ApiConstant.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Object? data,
      Map<String, dynamic>? headers}) {
    return dio.post(
      ApiConstant.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> patchData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Object? data,
      Map<String, dynamic>? headers}) {
    return dio.patch(
      ApiConstant.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> deleteData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Object? data,
      Map<String, dynamic>? headers}) {
    return dio.delete(
      ApiConstant.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }
}
