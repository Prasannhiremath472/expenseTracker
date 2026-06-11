import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';

class AuthResult {
  AuthResult({required this.user, required this.token});

  final UserModel user;
  final String token;

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );
  }
}

class AuthRemoteDataSource {
  AuthRemoteDataSource(this._dioClient);

  final DioClient _dioClient;

  Future<AuthResult> register({
    required String fullName,
    required String mobile,
    required String email,
    required String password,
  }) async {
    final response = await _dioClient.post(ApiConstants.register, data: {
      'fullName': fullName,
      'mobile': mobile,
      'email': email,
      'password': password,
    });

    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return AuthResult.fromJson(data);
  }

  Future<AuthResult> login({
    required String emailOrMobile,
    required String password,
  }) async {
    final response = await _dioClient.post(ApiConstants.login, data: {
      'emailOrMobile': emailOrMobile,
      'password': password,
    });

    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return AuthResult.fromJson(data);
  }

  Future<String> forgotPassword({required String email}) async {
    final response = await _dioClient.post(ApiConstants.forgotPassword, data: {'email': email});
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return data['message'] as String? ?? 'Password reset requested';
  }

  Future<UserModel> getProfile() async {
    final response = await _dioClient.get(ApiConstants.me);
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }
}
