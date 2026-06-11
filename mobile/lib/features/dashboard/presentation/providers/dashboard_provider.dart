import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/models/dashboard_model.dart';
import '../../data/repositories/dashboard_repository.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.watch(dioClientProvider));
});

final dashboardProvider = FutureProvider.autoDispose<DashboardModel>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  final result = await repository.getDashboardStats();
  return result.when(
    success: (dashboard) => dashboard,
    failure: (failure) => throw failure,
  );
});
