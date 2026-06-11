import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    required String userId,
    required String projectName,
    required String clientName,
    required String siteAddress,
    required DateTime startDate,
    @JsonKey(fromJson: _amountFromJson, toJson: _amountToJson) required double estimatedBudget,
    String? description,
    @Default('ACTIVE') String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    // Optional fields populated only on the project details endpoint
    @JsonKey(fromJson: _amountFromJsonNullable, toJson: _amountToJson) double? totalExpenses,
    @JsonKey(name: '_count') ProjectCounts? counts,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
}

@freezed
class ProjectCounts with _$ProjectCounts {
  const factory ProjectCounts({
    @Default(0) int expenses,
    @Default(0) int dailyReports,
  }) = _ProjectCounts;

  factory ProjectCounts.fromJson(Map<String, dynamic> json) => _$ProjectCountsFromJson(json);
}

double _amountFromJson(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.parse(value);
  return 0;
}

double? _amountFromJsonNullable(dynamic value) {
  if (value == null) return null;
  return _amountFromJson(value);
}

double _amountToJson(double? value) => value ?? 0;
