import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../../../core/utils/result.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepository {
  AuthRepository(this._remoteDataSource, this._secureStorage);

  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorageService _secureStorage;

  Future<Result<UserModel>> register({
    required String fullName,
    required String mobile,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.register(
        fullName: fullName,
        mobile: mobile,
        email: email,
        password: password,
      );
      await _persistSession(result);
      return Success(result.user);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<UserModel>> login({
    required String emailOrMobile,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.login(emailOrMobile: emailOrMobile, password: password);
      await _persistSession(result);
      return Success(result.user);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<String>> forgotPassword({required String email}) async {
    try {
      final message = await _remoteDataSource.forgotPassword(email: email);
      return Success(message);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<UserModel>> getProfile() async {
    try {
      final user = await _remoteDataSource.getProfile();
      return Success(user);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<bool> hasValidSession() async {
    final token = await _secureStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {
    await _secureStorage.clear();
  }

  Future<void> _persistSession(AuthResult result) async {
    await _secureStorage.saveToken(result.token);
    await _secureStorage.saveUserId(result.user.id);
  }

  Failure _mapException(Object e) {
    if (e is ServerException) {
      return ServerFailure(e.message, statusCode: e.statusCode, errors: e.errors);
    }
    if (e is NetworkException) {
      return NetworkFailure(e.message);
    }
    if (e is UnauthorizedException) {
      return UnauthorizedFailure(e.message);
    }
    return UnknownFailure(e.toString());
  }
}
