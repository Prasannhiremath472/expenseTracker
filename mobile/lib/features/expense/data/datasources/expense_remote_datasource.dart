import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/expense_model.dart';

class ExpenseListResult {
  ExpenseListResult({required this.expenses, required this.total, required this.totalPages});

  final List<ExpenseModel> expenses;
  final int total;
  final int totalPages;
}

class ExpenseRemoteDataSource {
  ExpenseRemoteDataSource(this._dioClient);

  final DioClient _dioClient;

  Future<ExpenseListResult> getExpenses({
    String? projectId,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _dioClient.get(ApiConstants.expenses, queryParameters: {
      if (projectId != null) 'projectId': projectId,
      if (category != null) 'category': category,
      if (startDate != null) 'startDate': startDate.toIso8601String(),
      if (endDate != null) 'endDate': endDate.toIso8601String(),
      if (search != null && search.isNotEmpty) 'search': search,
      'page': page,
      'limit': limit,
    });

    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    final expenses = (data['expenses'] as List<dynamic>)
        .map((e) => ExpenseModel.fromJson(e as Map<String, dynamic>))
        .toList();
    final pagination = data['pagination'] as Map<String, dynamic>;

    return ExpenseListResult(
      expenses: expenses,
      total: pagination['total'] as int,
      totalPages: pagination['totalPages'] as int,
    );
  }

  Future<ExpenseModel> getExpenseById(String id) async {
    final response = await _dioClient.get('${ApiConstants.expenses}/$id');
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return ExpenseModel.fromJson(data);
  }

  Future<ExpenseModel> createExpense(Map<String, dynamic> fields, {String? billImagePath}) async {
    final formData = await _buildFormData(fields, billImagePath);
    final response = await _dioClient.post(ApiConstants.expenses, data: formData);
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return ExpenseModel.fromJson(data);
  }

  Future<ExpenseModel> updateExpense(String id, Map<String, dynamic> fields, {String? billImagePath}) async {
    final formData = await _buildFormData(fields, billImagePath);
    final response = await _dioClient.put('${ApiConstants.expenses}/$id', data: formData);
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return ExpenseModel.fromJson(data);
  }

  Future<void> deleteExpense(String id) async {
    await _dioClient.delete('${ApiConstants.expenses}/$id');
  }

  Future<FormData> _buildFormData(Map<String, dynamic> fields, String? billImagePath) async {
    final map = <String, dynamic>{};
    fields.forEach((key, value) {
      if (value != null) map[key] = value.toString();
    });

    if (billImagePath != null) {
      map['billImage'] = await MultipartFile.fromFile(billImagePath);
    }

    return FormData.fromMap(map);
  }
}
