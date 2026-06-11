/// Exceptions thrown by data sources (remote/local).
class ServerException implements Exception {
  final String message;
  final int? statusCode;
  final List<Map<String, dynamic>>? errors;

  const ServerException({required this.message, this.statusCode, this.errors});
}

class CacheException implements Exception {
  final String message;

  const CacheException({required this.message});
}

class NetworkException implements Exception {
  final String message;

  const NetworkException({this.message = 'No internet connection'});
}

class UnauthorizedException implements Exception {
  final String message;

  const UnauthorizedException({this.message = 'Session expired. Please log in again.'});
}
