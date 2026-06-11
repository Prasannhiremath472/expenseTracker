import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/hive_service.dart';
import '../models/project_model.dart';

class ProjectLocalDataSource {
  ProjectLocalDataSource(this._hiveService);

  final HiveService _hiveService;

  Future<void> cacheProjects(List<ProjectModel> projects) async {
    await _hiveService.replaceAll(
      HiveBoxes.projects,
      projects.map((p) => p.toJson()).toList(),
      (json) => json['id'] as String,
    );
  }

  List<ProjectModel> getCachedProjects() {
    return _hiveService
        .getAll(HiveBoxes.projects)
        .map((json) => ProjectModel.fromJson(json))
        .toList();
  }

  Future<void> cacheProject(ProjectModel project) async {
    await _hiveService.put(HiveBoxes.projects, project.id, project.toJson());
  }

  Future<void> removeCachedProject(String id) async {
    await _hiveService.delete(HiveBoxes.projects, id);
  }
}
