import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/expense_local_datasource.dart';
import '../../data/datasources/expense_remote_datasource.dart';
import '../../data/models/expense_model.dart';
import '../../data/repositories/expense_repository.dart';

final expenseRemoteDataSourceProvider = Provider<ExpenseRemoteDataSource>((ref) {
  return ExpenseRemoteDataSource(ref.watch(dioClientProvider));
});

final expenseLocalDataSourceProvider = Provider<ExpenseLocalDataSource>((ref) {
  return ExpenseLocalDataSource(ref.watch(hiveServiceProvider));
});

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepository(
    ref.watch(expenseRemoteDataSourceProvider),
    ref.watch(expenseLocalDataSourceProvider),
    ref.watch(networkInfoProvider),
  );
});

/// Filter criteria for the expense list.
class ExpenseFilter {
  const ExpenseFilter({this.projectId, this.category, this.startDate, this.endDate, this.search});

  final String? projectId;
  final String? category;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? search;

  ExpenseFilter copyWith({
    String? projectId,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
    String? search,
    bool clearProjectId = false,
    bool clearCategory = false,
    bool clearDates = false,
    bool clearSearch = false,
  }) {
    return ExpenseFilter(
      projectId: clearProjectId ? null : (projectId ?? this.projectId),
      category: clearCategory ? null : (category ?? this.category),
      startDate: clearDates ? null : (startDate ?? this.startDate),
      endDate: clearDates ? null : (endDate ?? this.endDate),
      search: clearSearch ? null : (search ?? this.search),
    );
  }
}

final expenseFilterProvider = StateProvider<ExpenseFilter>((ref) => const ExpenseFilter());

class ExpenseListNotifier extends StateNotifier<AsyncValue<List<ExpenseModel>>> {
  ExpenseListNotifier(this._repository, this._filter) : super(const AsyncValue.loading()) {
    load();
  }

  final ExpenseRepository _repository;
  final ExpenseFilter _filter;

  Future<void> load() async {
    state = const AsyncValue.loading();
    final result = await _repository.getExpenses(
      projectId: _filter.projectId,
      category: _filter.category,
      startDate: _filter.startDate,
      endDate: _filter.endDate,
      search: _filter.search,
    );
    result.when(
      success: (expenses) => state = AsyncValue.data(expenses),
      failure: (failure) => state = AsyncValue.error(failure, StackTrace.current),
    );
  }

  Future<void> refresh() => load();

  Future<dynamic> deleteExpense(String id) async {
    final result = await _repository.deleteExpense(id);
    return result.when(
      success: (_) {
        refresh();
        return null;
      },
      failure: (failure) => failure,
    );
  }
}

final expenseListProvider =
    StateNotifierProvider.autoDispose<ExpenseListNotifier, AsyncValue<List<ExpenseModel>>>((ref) {
  final filter = ref.watch(expenseFilterProvider);
  return ExpenseListNotifier(ref.watch(expenseRepositoryProvider), filter);
});

final expenseDetailsProvider =
    FutureProvider.autoDispose.family<ExpenseModel, String>((ref, id) async {
  final repository = ref.watch(expenseRepositoryProvider);
  final result = await repository.getExpenseById(id);
  return result.when(
    success: (expense) => expense,
    failure: (failure) => throw failure,
  );
});

class ExpenseFormNotifier extends StateNotifier<AsyncValue<void>> {
  ExpenseFormNotifier(this._repository) : super(const AsyncValue.data(null));

  final ExpenseRepository _repository;

  Future<ExpenseModel?> submit({
    String? id,
    required String projectId,
    required DateTime date,
    required String category,
    required double amount,
    String? description,
    String? vendorName,
    required String paymentMode,
    String? billImagePath,
  }) async {
    state = const AsyncValue.loading();

    final fields = {
      'projectId': projectId,
      'date': date.toIso8601String(),
      'category': category,
      'amount': amount,
      'description': description,
      'vendorName': vendorName,
      'paymentMode': paymentMode,
    };

    final result = id == null
        ? await _repository.createExpense(fields, billImagePath: billImagePath)
        : await _repository.updateExpense(id, fields, billImagePath: billImagePath);

    return result.when(
      success: (expense) {
        state = const AsyncValue.data(null);
        return expense;
      },
      failure: (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        return null;
      },
    );
  }
}

final expenseFormProvider =
    StateNotifierProvider.autoDispose<ExpenseFormNotifier, AsyncValue<void>>((ref) {
  return ExpenseFormNotifier(ref.watch(expenseRepositoryProvider));
});

/// Fetches all expenses for [projectId] within an optional date range, for PDF export.
/// Pages through the full result set since PDF generation needs the complete data.
final expensesForExportProvider = FutureProvider.autoDispose
    .family<List<ExpenseModel>, ({String projectId, DateTime? startDate, DateTime? endDate})>(
        (ref, params) async {
  final repository = ref.watch(expenseRepositoryProvider);
  final result = await repository.getExpenses(
    projectId: params.projectId,
    startDate: params.startDate,
    endDate: params.endDate,
    limit: 500,
  );
  return result.when(
    success: (expenses) => expenses,
    failure: (failure) => throw failure,
  );
});
