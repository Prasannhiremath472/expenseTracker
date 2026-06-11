import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../error/exceptions.dart';
import 'api_interceptor.dart';

/// Thin wrapper around [Dio] configured with base URL, timeouts and
/// the auth interceptor. Converts Dio errors into domain [ServerException]/
/// [NetworkException]/[UnauthorizedException].
class DioClient {
  DioClient(ApiInterceptor interceptor) : dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout: ApiConstants.connectTimeout,
            receiveTimeout: ApiConstants.receiveTimeout,
          ),
        ) {
    dio.interceptors.add(interceptor);
  }

  final Dio dio;

  Future<Response<dynamic>> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _wrap(() => dio.get(path, queryParameters: queryParameters));
  }

  Future<Response<dynamic>> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _wrap(() => dio.post(path, data: data, queryParameters: queryParameters));
  }

  Future<Response<dynamic>> put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _wrap(() => dio.put(path, data: data, queryParameters: queryParameters));
  }

  Future<Response<dynamic>> delete(String path, {Map<String, dynamic>? queryParameters}) {
    return _wrap(() => dio.delete(path, queryParameters: queryParameters));
  }

  Future<Response<dynamic>> _wrap(Future<Response<dynamic>> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException();
      }

      final statusCode = e.response?.statusCode;
      final data = e.response?.data;

      if (statusCode == 401) {
        throw const UnauthorizedException();
      }

      String message = 'Something went wrong';
      List<Map<String, dynamic>>? errors;

      if (data is Map<String, dynamic>) {
        message = data['message']?.toString() ?? message;
        if (data['errors'] is List) {
          errors = (data['errors'] as List).cast<Map<String, dynamic>>();
        }
      }

      throw ServerException(message: message, statusCode: statusCode, errors: errors);
    }
  }
}
