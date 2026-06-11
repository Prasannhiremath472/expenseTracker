import 'package:dio/dio.dart';
import '../storage/secure_storage_service.dart';

/// Attaches the JWT bearer token to outgoing requests and surfaces
/// 401 responses so the app can redirect to login.
class ApiInterceptor extends Interceptor {
  ApiInterceptor(this._secureStorage, {this.onUnauthorized});

  final SecureStorageService _secureStorage;
  final Future<void> Function()? onUnauthorized;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secureStorage.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await onUnauthorized?.call();
    }
    handler.next(err);
  }
}
