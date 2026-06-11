import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../datasources/report_local_datasource.dart';
import '../datasources/report_remote_datasource.dart';
import '../models/report_model.dart';

class ReportRepository {
  ReportRepository(this._remoteDataSource, this._localDataSource, this._networkInfo);

  final ReportRemoteDataSource _remoteDataSource;
  final ReportLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  Future<Result<List<ReportModel>>> getReports({
    String? projectId,
    DateTime? startDate,
    DateTime? endDate,
    int page = 1,
    int limit = 20,
  }) async {
    final isConnected = await _networkInfo.isConnected;

    if (!isConnected) {
      return Success(_filterCached(projectId: projectId));
    }

    try {
      final result = await _remoteDataSource.getReports(
        projectId: projectId,
        startDate: startDate,
        endDate: endDate,
        page: page,
        limit: limit,
      );

      if (page == 1 && projectId == null) {
        await _localDataSource.cacheReports(result.reports);
      }

      return Success(result.reports);
    } catch (e) {
      final cached = _filterCached(projectId: projectId);
      if (cached.isNotEmpty) return Success(cached);
      return FailureResult(_mapException(e));
    }
  }

  List<ReportModel> _filterCached({String? projectId}) {
    var cached = _localDataSource.getCachedReports();
    if (projectId != null) cached = cached.where((r) => r.projectId == projectId).toList();
    return cached;
  }

  Future<Result<ReportModel>> getReportById(String id) async {
    try {
      final report = await _remoteDataSource.getReportById(id);
      await _localDataSource.cacheReport(report);
      return Success(report);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<ReportModel>> createReport(Map<String, dynamic> fields, {List<String>? sitePhotoPaths}) async {
    try {
      final report = await _remoteDataSource.createReport(fields, sitePhotoPaths: sitePhotoPaths);
      await _localDataSource.cacheReport(report);
      return Success(report);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<ReportModel>> updateReport(String id, Map<String, dynamic> fields, {List<String>? sitePhotoPaths}) async {
    try {
      final report = await _remoteDataSource.updateReport(id, fields, sitePhotoPaths: sitePhotoPaths);
      await _localDataSource.cacheReport(report);
      return Success(report);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<void>> deleteReport(String id) async {
    try {
      await _remoteDataSource.deleteReport(id);
      await _localDataSource.removeCachedReport(id);
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
