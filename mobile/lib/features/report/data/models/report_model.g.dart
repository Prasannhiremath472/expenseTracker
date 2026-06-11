// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportModelImpl _$$ReportModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportModelImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      workersCount: (json['workersCount'] as num).toInt(),
      workCompleted: json['workCompleted'] as String?,
      materialsUsed: json['materialsUsed'] as String?,
      issuesFaced: json['issuesFaced'] as String?,
      notes: json['notes'] as String?,
      sitePhotoUrls: (json['sitePhotoUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      project: json['project'] == null
          ? null
          : ReportProject.fromJson(json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReportModelImplToJson(_$ReportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'workersCount': instance.workersCount,
      'workCompleted': instance.workCompleted,
      'materialsUsed': instance.materialsUsed,
      'issuesFaced': instance.issuesFaced,
      'notes': instance.notes,
      'sitePhotoUrls': instance.sitePhotoUrls,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'project': instance.project,
    };

_$ReportProjectImpl _$$ReportProjectImplFromJson(Map<String, dynamic> json) =>
    _$ReportProjectImpl(
      projectName: json['projectName'] as String,
    );

Map<String, dynamic> _$$ReportProjectImplToJson(_$ReportProjectImpl instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
    };
