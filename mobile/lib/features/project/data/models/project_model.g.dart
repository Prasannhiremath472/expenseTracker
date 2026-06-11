// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      projectName: json['projectName'] as String,
      clientName: json['clientName'] as String,
      siteAddress: json['siteAddress'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      estimatedBudget: _amountFromJson(json['estimatedBudget']),
      description: json['description'] as String?,
      status: json['status'] as String? ?? 'ACTIVE',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      totalExpenses: _amountFromJsonNullable(json['totalExpenses']),
      counts: json['_count'] == null
          ? null
          : ProjectCounts.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'projectName': instance.projectName,
      'clientName': instance.clientName,
      'siteAddress': instance.siteAddress,
      'startDate': instance.startDate.toIso8601String(),
      'estimatedBudget': _amountToJson(instance.estimatedBudget),
      'description': instance.description,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'totalExpenses': _amountToJson(instance.totalExpenses),
      '_count': instance.counts,
    };

_$ProjectCountsImpl _$$ProjectCountsImplFromJson(Map<String, dynamic> json) =>
    _$ProjectCountsImpl(
      expenses: (json['expenses'] as num?)?.toInt() ?? 0,
      dailyReports: (json['dailyReports'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProjectCountsImplToJson(_$ProjectCountsImpl instance) =>
    <String, dynamic>{
      'expenses': instance.expenses,
      'dailyReports': instance.dailyReports,
    };
