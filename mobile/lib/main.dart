import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/providers/core_providers.dart';
import 'core/storage/hive_service.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'routes/app_router.dart';
import 'services/connectivity_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const ProviderScope(child: SiteExpenseTrackerApp()));
}

class SiteExpenseTrackerApp extends ConsumerWidget {
  const SiteExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    ref.watch(connectivityServiceProvider);

    Future.microtask(() {
      ref.read(unauthorizedHandlerProvider.notifier).state = () async {
        await ref.read(authNotifierProvider.notifier).logout();
      };
    });

    return MaterialApp.router(
      title: 'Urja Construction',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
