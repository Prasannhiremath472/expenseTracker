import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource(ref.watch(dioClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(secureStorageProvider),
  );
});

/// Represents the current authentication state of the app.
sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.user);
  final UserModel user;
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({this.failure});
  final Failure? failure;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._repository) : super(const AuthInitial());

  final AuthRepository _repository;

  /// Called at app startup to check for a persisted session.
  Future<void> checkSession() async {
    state = const AuthLoading();
    final hasSession = await _repository.hasValidSession();

    if (!hasSession) {
      state = const AuthUnauthenticated();
      return;
    }

    final result = await _repository.getProfile();
    result.when(
      success: (user) => state = AuthAuthenticated(user),
      failure: (failure) async {
        await _repository.logout();
        state = AuthUnauthenticated(failure: failure);
      },
    );
  }

  Future<bool> login({required String emailOrMobile, required String password}) async {
    state = const AuthLoading();
    final result = await _repository.login(emailOrMobile: emailOrMobile, password: password);

    return result.when(
      success: (user) {
        state = AuthAuthenticated(user);
        return true;
      },
      failure: (failure) {
        state = AuthUnauthenticated(failure: failure);
        return false;
      },
    );
  }

  Future<bool> register({
    required String fullName,
    required String mobile,
    required String email,
    required String password,
  }) async {
    state = const AuthLoading();
    final result = await _repository.register(
      fullName: fullName,
      mobile: mobile,
      email: email,
      password: password,
    );

    return result.when(
      success: (user) {
        state = AuthAuthenticated(user);
        return true;
      },
      failure: (failure) {
        state = AuthUnauthenticated(failure: failure);
        return false;
      },
    );
  }

  Future<String?> forgotPassword({required String email}) async {
    final result = await _repository.forgotPassword(email: email);
    return result.when(
      success: (message) => message,
      failure: (failure) => null,
    );
  }

  Future<void> logout() async {
    await _repository.logout();
    state = const AuthUnauthenticated();
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
