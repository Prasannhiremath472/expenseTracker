import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/network/network_info.dart';
import '../core/providers/core_providers.dart';
import '../features/expense/presentation/providers/expense_providers.dart';
import '../features/project/presentation/providers/project_providers.dart';
import '../features/report/presentation/providers/report_providers.dart';

/// Listens for connectivity changes and refreshes cached lists from the
/// server once the device comes back online, so locally cached data stays
/// in sync after an offline period.
class ConnectivityService {
  ConnectivityService(this._ref) {
    _subscription = _ref.read(networkInfoProvider).onConnectivityChanged.listen(_onConnectivityChanged);
  }

  final Ref _ref;
  StreamSubscription<bool>? _subscription;
  bool _wasOffline = false;

  void _onConnectivityChanged(bool isConnected) {
    if (!isConnected) {
      _wasOffline = true;
      return;
    }

    if (_wasOffline) {
      _wasOffline = false;
      _syncAll();
    }
  }

  void _syncAll() {
    _ref.read(projectListProvider.notifier).refresh();
    _ref.read(expenseListProvider.notifier).refresh();
    _ref.read(reportListProvider.notifier).refresh();
  }

  void dispose() {
    _subscription?.cancel();
  }
}

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  final service = ConnectivityService(ref);
  ref.onDispose(service.dispose);
  return service;
});
