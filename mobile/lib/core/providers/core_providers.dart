import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/api_interceptor.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../storage/hive_service.dart';
import '../storage/secure_storage_service.dart';

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService(const FlutterSecureStorage());
});

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(Connectivity());
});

/// Set by the app shell once it can react to 401s (e.g. force logout + redirect).
final unauthorizedHandlerProvider = StateProvider<Future<void> Function()?>((ref) => null);

final dioClientProvider = Provider<DioClient>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  final interceptor = ApiInterceptor(
    secureStorage,
    onUnauthorized: () async {
      final handler = ref.read(unauthorizedHandlerProvider);
      if (handler != null) await handler();
    },
  );
  return DioClient(interceptor);
});
