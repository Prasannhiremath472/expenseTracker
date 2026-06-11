import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/hive_service.dart';
import '../models/report_model.dart';

class ReportLocalDataSource {
  ReportLocalDataSource(this._hiveService);

  final HiveService _hiveService;

  Future<void> cacheReports(List<ReportModel> reports) async {
    await _hiveService.replaceAll(
      HiveBoxes.reports,
      reports.map((e) => e.toJson()).toList(),
      (json) => json['id'] as String,
    );
  }

  List<ReportModel> getCachedReports() {
    return _hiveService
        .getAll(HiveBoxes.reports)
        .map((json) => ReportModel.fromJson(json))
        .toList();
  }

  Future<void> cacheReport(ReportModel report) async {
    await _hiveService.put(HiveBoxes.reports, report.id, report.toJson());
  }

  Future<void> removeCachedReport(String id) async {
    await _hiveService.delete(HiveBoxes.reports, id);
  }
}
