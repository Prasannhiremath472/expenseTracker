import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel({
    required String id,
    required String projectId,
    required String userId,
    required DateTime date,
    required int workersCount,
    String? workCompleted,
    String? materialsUsed,
    String? issuesFaced,
    String? notes,
    @Default(<String>[]) List<String> sitePhotoUrls,
    required DateTime createdAt,
    required DateTime updatedAt,
    ReportProject? project,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, dynamic> json) => _$ReportModelFromJson(json);
}

@freezed
class ReportProject with _$ReportProject {
  const factory ReportProject({
    required String projectName,
  }) = _ReportProject;

  factory ReportProject.fromJson(Map<String, dynamic> json) => _$ReportProjectFromJson(json);
}
