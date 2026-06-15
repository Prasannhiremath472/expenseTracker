import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/report_local_datasource.dart';
import '../../data/datasources/report_remote_datasource.dart';
import '../../data/models/report_model.dart';
import '../../data/repositories/report_repository.dart';

final reportRemoteDataSourceProvider = Provider<ReportRemoteDataSource>((ref) {
  return ReportRemoteDataSource(ref.watch(dioClientProvider));
});

final reportLocalDataSourceProvider = Provider<ReportLocalDataSource>((ref) {
  return ReportLocalDataSource(ref.watch(hiveServiceProvider));
});

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepository(
    ref.watch(reportRemoteDataSourceProvider),
    ref.watch(reportLocalDataSourceProvider),
    ref.watch(networkInfoProvider),
  );
});

/// Filter criteria for the report list.
class ReportFilter {
  const ReportFilter({this.projectId, this.startDate, this.endDate});

  final String? projectId;
  final DateTime? startDate;
  final DateTime? endDate;

  ReportFilter copyWith({
    String? projectId,
    DateTime? startDate,
    DateTime? endDate,
    bool clearProjectId = false,
    bool clearDates = false,
  }) {
    return ReportFilter(
      projectId: clearProjectId ? null : (projectId ?? this.projectId),
      startDate: clearDates ? null : (startDate ?? this.startDate),
      endDate: clearDates ? null : (endDate ?? this.endDate),
    );
  }
}

final reportFilterProvider = StateProvider<ReportFilter>((ref) => const ReportFilter());

class ReportListNotifier extends StateNotifier<AsyncValue<List<ReportModel>>> {
  ReportListNotifier(this._repository, this._filter) : super(const AsyncValue.loading()) {
    load();
  }

  final ReportRepository _repository;
  final ReportFilter _filter;

  Future<void> load() async {
    state = const AsyncValue.loading();
    final result = await _repository.getReports(
      projectId: _filter.projectId,
      startDate: _filter.startDate,
      endDate: _filter.endDate,
    );
    result.when(
      success: (reports) => state = AsyncValue.data(reports),
      failure: (failure) => state = AsyncValue.error(failure, StackTrace.current),
    );
  }

  Future<void> refresh() => load();

  Future<dynamic> deleteReport(String id) async {
    final result = await _repository.deleteReport(id);
    return result.when(
      success: (_) {
        refresh();
        return null;
      },
      failure: (failure) => failure,
    );
  }
}

final reportListProvider =
    StateNotifierProvider.autoDispose<ReportListNotifier, AsyncValue<List<ReportModel>>>((ref) {
  final filter = ref.watch(reportFilterProvider);
  return ReportListNotifier(ref.watch(reportRepositoryProvider), filter);
});

final reportDetailsProvider =
    FutureProvider.autoDispose.family<ReportModel, String>((ref, id) async {
  final repository = ref.watch(reportRepositoryProvider);
  final result = await repository.getReportById(id);
  return result.when(
    success: (report) => report,
    failure: (failure) => throw failure,
  );
});

class ReportFormNotifier extends StateNotifier<AsyncValue<void>> {
  ReportFormNotifier(this._repository) : super(const AsyncValue.data(null));

  final ReportRepository _repository;

  Future<ReportModel?> submit({
    String? id,
    required String projectId,
    required DateTime date,
    required int workersCount,
    String? workCompleted,
    String? materialsUsed,
    String? issuesFaced,
    String? notes,
    List<String>? sitePhotoPaths,
  }) async {
    state = const AsyncValue.loading();

    final fields = {
      'projectId': projectId,
      'date': date.toIso8601String(),
      'workersCount': workersCount,
      'workCompleted': workCompleted,
      'materialsUsed': materialsUsed,
      'issuesFaced': issuesFaced,
      'notes': notes,
    };

    final result = id == null
        ? await _repository.createReport(fields, sitePhotoPaths: sitePhotoPaths)
        : await _repository.updateReport(id, fields, sitePhotoPaths: sitePhotoPaths);

    return result.when(
      success: (report) {
        state = const AsyncValue.data(null);
        return report;
      },
      failure: (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        return null;
      },
    );
  }
}

final reportFormProvider =
    StateNotifierProvider.autoDispose<ReportFormNotifier, AsyncValue<void>>((ref) {
  return ReportFormNotifier(ref.watch(reportRepositoryProvider));
});

/// Fetches all reports for [projectId] within an optional date range, for PDF export.
/// Pages through the full result set since PDF generation needs the complete data.
final reportsForExportProvider = FutureProvider.autoDispose
    .family<List<ReportModel>, ({String projectId, DateTime? startDate, DateTime? endDate})>(
        (ref, params) async {
  final repository = ref.watch(reportRepositoryProvider);
  final result = await repository.getReports(
    projectId: params.projectId,
    startDate: params.startDate,
    endDate: params.endDate,
    limit: 500,
  );
  return result.when(
    success: (reports) => reports,
    failure: (failure) => throw failure,
  );
});
