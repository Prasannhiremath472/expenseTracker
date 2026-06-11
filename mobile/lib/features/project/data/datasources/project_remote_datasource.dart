import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/project_model.dart';

class ProjectRemoteDataSource {
  ProjectRemoteDataSource(this._dioClient);

  final DioClient _dioClient;

  Future<List<ProjectModel>> getProjects({String? status}) async {
    final response = await _dioClient.get(
      ApiConstants.projects,
      queryParameters: status != null ? {'status': status} : null,
    );
    final data = (response.data as Map<String, dynamic>)['data'] as List<dynamic>;
    return data.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<ProjectModel> getProjectById(String id) async {
    final response = await _dioClient.get('${ApiConstants.projects}/$id');
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return ProjectModel.fromJson(data);
  }

  Future<ProjectModel> createProject(Map<String, dynamic> payload) async {
    final response = await _dioClient.post(ApiConstants.projects, data: payload);
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return ProjectModel.fromJson(data);
  }

  Future<ProjectModel> updateProject(String id, Map<String, dynamic> payload) async {
    final response = await _dioClient.put('${ApiConstants.projects}/$id', data: payload);
    final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return ProjectModel.fromJson(data);
  }

  Future<void> deleteProject(String id) async {
    await _dioClient.delete('${ApiConstants.projects}/$id');
  }
}
