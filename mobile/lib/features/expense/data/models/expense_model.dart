import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    required String id,
    required String projectId,
    required String userId,
    required DateTime date,
    required String category,
    @JsonKey(fromJson: _amountFromJson) required double amount,
    String? description,
    String? vendorName,
    required String paymentMode,
    String? billImageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    ExpenseProject? project,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => _$ExpenseModelFromJson(json);
}

@freezed
class ExpenseProject with _$ExpenseProject {
  const factory ExpenseProject({
    required String projectName,
  }) = _ExpenseProject;

  factory ExpenseProject.fromJson(Map<String, dynamic> json) => _$ExpenseProjectFromJson(json);
}

double _amountFromJson(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.parse(value);
  return 0;
}
