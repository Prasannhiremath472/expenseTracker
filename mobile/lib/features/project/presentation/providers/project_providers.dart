import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/project_local_datasource.dart';
import '../../data/datasources/project_remote_datasource.dart';
import '../../data/models/project_model.dart';
import '../../data/repositories/project_repository.dart';

final projectRemoteDataSourceProvider = Provider<ProjectRemoteDataSource>((ref) {
  return ProjectRemoteDataSource(ref.watch(dioClientProvider));
});

final projectLocalDataSourceProvider = Provider<ProjectLocalDataSource>((ref) {
  return ProjectLocalDataSource(ref.watch(hiveServiceProvider));
});

final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  return ProjectRepository(
    ref.watch(projectRemoteDataSourceProvider),
    ref.watch(projectLocalDataSourceProvider),
    ref.watch(networkInfoProvider),
  );
});

/// Holds the list of projects, optionally filtered by status.
class ProjectListNotifier extends StateNotifier<AsyncValue<List<ProjectModel>>> {
  ProjectListNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadProjects();
  }

  final ProjectRepository _repository;
  String? _statusFilter;

  String? get statusFilter => _statusFilter;

  Future<void> loadProjects({String? status}) async {
    _statusFilter = status;
    state = const AsyncValue.loading();
    final result = await _repository.getProjects(status: status);
    result.when(
      success: (projects) => state = AsyncValue.data(projects),
      failure: (failure) => state = AsyncValue.error(failure, StackTrace.current),
    );
  }

  Future<void> refresh() => loadProjects(status: _statusFilter);

  Future<Failure?> deleteProject(String id) async {
    final result = await _repository.deleteProject(id);
    return result.when(
      success: (_) {
        refresh();
        return null;
      },
      failure: (failure) => failure,
    );
  }
}

final projectListProvider =
    StateNotifierProvider<ProjectListNotifier, AsyncValue<List<ProjectModel>>>((ref) {
  return ProjectListNotifier(ref.watch(projectRepositoryProvider));
});

/// Fetches a single project's details (with expense/report counts).
final projectDetailsProvider =
    FutureProvider.autoDispose.family<ProjectModel, String>((ref, id) async {
  final repository = ref.watch(projectRepositoryProvider);
  final result = await repository.getProjectById(id);
  return result.when(
    success: (project) => project,
    failure: (failure) => throw failure,
  );
});

/// Handles create/update form submission state.
class ProjectFormNotifier extends StateNotifier<AsyncValue<void>> {
  ProjectFormNotifier(this._repository) : super(const AsyncValue.data(null));

  final ProjectRepository _repository;

  Future<ProjectModel?> submit({
    String? id,
    required String projectName,
    required String clientName,
    required String siteAddress,
    required DateTime startDate,
    required double estimatedBudget,
    String? description,
    required String status,
  }) async {
    state = const AsyncValue.loading();

    final payload = {
      'projectName': projectName,
      'clientName': clientName,
      'siteAddress': siteAddress,
      'startDate': startDate.toIso8601String(),
      'estimatedBudget': estimatedBudget,
      'description': description,
      'status': status,
    };

    final result = id == null
        ? await _repository.createProject(payload)
        : await _repository.updateProject(id, payload);

    return result.when(
      success: (project) {
        state = const AsyncValue.data(null);
        return project;
      },
      failure: (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        return null;
      },
    );
  }
}

final projectFormProvider = StateNotifierProvider.autoDispose<ProjectFormNotifier, AsyncValue<void>>((ref) {
  return ProjectFormNotifier(ref.watch(projectRepositoryProvider));
});
