import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../datasources/expense_local_datasource.dart';
import '../datasources/expense_remote_datasource.dart';
import '../models/expense_model.dart';

class ExpenseRepository {
  ExpenseRepository(this._remoteDataSource, this._localDataSource, this._networkInfo);

  final ExpenseRemoteDataSource _remoteDataSource;
  final ExpenseLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  Future<Result<List<ExpenseModel>>> getExpenses({
    String? projectId,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    final isConnected = await _networkInfo.isConnected;

    if (!isConnected) {
      return Success(_filterCached(projectId: projectId, category: category, search: search));
    }

    try {
      final result = await _remoteDataSource.getExpenses(
        projectId: projectId,
        category: category,
        startDate: startDate,
        endDate: endDate,
        search: search,
        page: page,
        limit: limit,
      );

      if (page == 1 && projectId == null && category == null && search == null) {
        await _localDataSource.cacheExpenses(result.expenses);
      }

      return Success(result.expenses);
    } catch (e) {
      final cached = _filterCached(projectId: projectId, category: category, search: search);
      if (cached.isNotEmpty) return Success(cached);
      return FailureResult(_mapException(e));
    }
  }

  List<ExpenseModel> _filterCached({String? projectId, String? category, String? search}) {
    var cached = _localDataSource.getCachedExpenses();
    if (projectId != null) cached = cached.where((e) => e.projectId == projectId).toList();
    if (category != null) cached = cached.where((e) => e.category == category).toList();
    if (search != null && search.isNotEmpty) {
      final lower = search.toLowerCase();
      cached = cached
          .where((e) =>
              (e.vendorName?.toLowerCase().contains(lower) ?? false) ||
              (e.description?.toLowerCase().contains(lower) ?? false))
          .toList();
    }
    return cached;
  }

  Future<Result<ExpenseModel>> getExpenseById(String id) async {
    try {
      final expense = await _remoteDataSource.getExpenseById(id);
      await _localDataSource.cacheExpense(expense);
      return Success(expense);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<ExpenseModel>> createExpense(Map<String, dynamic> fields, {String? billImagePath}) async {
    try {
      final expense = await _remoteDataSource.createExpense(fields, billImagePath: billImagePath);
      await _localDataSource.cacheExpense(expense);
      return Success(expense);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<ExpenseModel>> updateExpense(String id, Map<String, dynamic> fields, {String? billImagePath}) async {
    try {
      final expense = await _remoteDataSource.updateExpense(id, fields, billImagePath: billImagePath);
      await _localDataSource.cacheExpense(expense);
      return Success(expense);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<void>> deleteExpense(String id) async {
    try {
      await _remoteDataSource.deleteExpense(id);
      await _localDataSource.removeCachedExpense(id);
      return const Success(null);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
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
