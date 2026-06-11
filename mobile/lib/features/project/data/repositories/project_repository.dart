import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../datasources/project_local_datasource.dart';
import '../datasources/project_remote_datasource.dart';
import '../models/project_model.dart';

class ProjectRepository {
  ProjectRepository(this._remoteDataSource, this._localDataSource, this._networkInfo);

  final ProjectRemoteDataSource _remoteDataSource;
  final ProjectLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  Future<Result<List<ProjectModel>>> getProjects({String? status}) async {
    final isConnected = await _networkInfo.isConnected;

    if (!isConnected) {
      var cached = _localDataSource.getCachedProjects();
      if (status != null) {
        cached = cached.where((p) => p.status == status).toList();
      }
      return Success(cached);
    }

    try {
      final projects = await _remoteDataSource.getProjects(status: status);
      if (status == null) {
        await _localDataSource.cacheProjects(projects);
      }
      return Success(projects);
    } catch (e) {
      var cached = _localDataSource.getCachedProjects();
      if (status != null) {
        cached = cached.where((p) => p.status == status).toList();
      }
      if (cached.isNotEmpty) {
        return Success(cached);
      }
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<ProjectModel>> getProjectById(String id) async {
    final isConnected = await _networkInfo.isConnected;

    if (!isConnected) {
      final cached = _localDataSource.getCachedProjects().where((p) => p.id == id).toList();
      if (cached.isNotEmpty) return Success(cached.first);
      return const FailureResult(NetworkFailure());
    }

    try {
      final project = await _remoteDataSource.getProjectById(id);
      await _localDataSource.cacheProject(project);
      return Success(project);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<ProjectModel>> createProject(Map<String, dynamic> payload) async {
    try {
      final project = await _remoteDataSource.createProject(payload);
      await _localDataSource.cacheProject(project);
      return Success(project);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<ProjectModel>> updateProject(String id, Map<String, dynamic> payload) async {
    try {
      final project = await _remoteDataSource.updateProject(id, payload);
      await _localDataSource.cacheProject(project);
      return Success(project);
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Future<Result<void>> deleteProject(String id) async {
    try {
      await _remoteDataSource.deleteProject(id);
      await _localDataSource.removeCachedProject(id);
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
