import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    required int totalProjects,
    required int activeProjects,
    @JsonKey(fromJson: _numFromJson) required double totalExpenses,
    @JsonKey(fromJson: _numFromJson) required double monthlyExpenses,
    @JsonKey(fromJson: _numFromJson) required double todaysExpenses,
    required List<CategoryExpense> expenseByCategory,
    required List<MonthlyExpense> expenseByMonth,
    required List<RecentExpense> recentExpenses,
    required List<RecentReport> recentReports,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);
}

@freezed
class CategoryExpense with _$CategoryExpense {
  const factory CategoryExpense({
    required String category,
    @JsonKey(fromJson: _numFromJson) required double total,
  }) = _CategoryExpense;

  factory CategoryExpense.fromJson(Map<String, dynamic> json) => _$CategoryExpenseFromJson(json);
}

@freezed
class MonthlyExpense with _$MonthlyExpense {
  const factory MonthlyExpense({
    required String month,
    @JsonKey(fromJson: _numFromJson) required double total,
  }) = _MonthlyExpense;

  factory MonthlyExpense.fromJson(Map<String, dynamic> json) => _$MonthlyExpenseFromJson(json);
}

@freezed
class RecentExpense with _$RecentExpense {
  const factory RecentExpense({
    required String id,
    required DateTime date,
    required String category,
    @JsonKey(fromJson: _numFromJson) required double amount,
    String? vendorName,
    required RecentExpenseProject project,
  }) = _RecentExpense;

  factory RecentExpense.fromJson(Map<String, dynamic> json) => _$RecentExpenseFromJson(json);
}

@freezed
class RecentExpenseProject with _$RecentExpenseProject {
  const factory RecentExpenseProject({
    required String projectName,
  }) = _RecentExpenseProject;

  factory RecentExpenseProject.fromJson(Map<String, dynamic> json) => _$RecentExpenseProjectFromJson(json);
}

@freezed
class RecentReport with _$RecentReport {
  const factory RecentReport({
    required String id,
    required DateTime date,
    required int workersCount,
    required RecentExpenseProject project,
  }) = _RecentReport;

  factory RecentReport.fromJson(Map<String, dynamic> json) => _$RecentReportFromJson(json);
}

double _numFromJson(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.parse(value);
  return 0;
}
