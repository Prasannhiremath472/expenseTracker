import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/report_model.dart';

class ReportListResult {
  ReportListResult({required this.reports, required this.total, required this.totalPages});

  final List<ReportModel> reports;
  final int total;
  final int totalPages;
}

class ReportRemoteDataSource {
  ReportRemoteDataSource(this._dioClient);

  final DioClient _dioClient;

  Future<ReportListResult> getReports({
    String? projectId,
    DateTime? startDate,
    DateTime? endDate,
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _dioClient.get(ApiConstants.reports, queryParameters: {
      if (projectId != null) 'projectId': projectId,
      if (startDate != null) 'startDate': startDate.toIso8601String(),
      if (endDate != null) 'endDate': endDate.toIso8601String(),
      'page': page,
      'limit': limit,
    });

    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    final reports = (data['reports'] as List<dynamic>)
        .map((e) => ReportModel.fromJson(e as Map<String, dynamic>))
        .toList();
    final pagination = data['pagination'] as Map<String, dynamic>;

    return ReportListResult(
      reports: reports,
      total: pagination['total'] as int,
      totalPages: pagination['totalPages'] as int,
    );
  }

  Future<ReportModel> getReportById(String id) async {
    final response = await _dioClient.get('${ApiConstants.reports}/$id');
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return ReportModel.fromJson(data);
  }

  Future<ReportModel> createReport(Map<String, dynamic> fields, {List<String>? sitePhotoPaths}) async {
    final formData = await _buildFormData(fields, sitePhotoPaths);
    final response = await _dioClient.post(ApiConstants.reports, data: formData);
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return ReportModel.fromJson(data);
  }

  Future<ReportModel> updateReport(String id, Map<String, dynamic> fields, {List<String>? sitePhotoPaths}) async {
    final formData = await _buildFormData(fields, sitePhotoPaths);
    final response = await _dioClient.put('${ApiConstants.reports}/$id', data: formData);
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return ReportModel.fromJson(data);
  }

  Future<void> deleteReport(String id) async {
    await _dioClient.delete('${ApiConstants.reports}/$id');
  }

  Future<FormData> _buildFormData(Map<String, dynamic> fields, List<String>? sitePhotoPaths) async {
    final map = <String, dynamic>{};
    fields.forEach((key, value) {
      if (value != null) map[key] = value.toString();
    });

    if (sitePhotoPaths != null && sitePhotoPaths.isNotEmpty) {
      map['sitePhotos'] = await Future.wait(
        sitePhotoPaths.map((path) => MultipartFile.fromFile(path)),
      );
    }

    return FormData.fromMap(map);
  }
}
