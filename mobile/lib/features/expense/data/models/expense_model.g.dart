// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      category: json['category'] as String,
      amount: _amountFromJson(json['amount']),
      description: json['description'] as String?,
      vendorName: json['vendorName'] as String?,
      paymentMode: json['paymentMode'] as String,
      billImageUrl: json['billImageUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      project: json['project'] == null
          ? null
          : ExpenseProject.fromJson(json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'category': instance.category,
      'amount': instance.amount,
      'description': instance.description,
      'vendorName': instance.vendorName,
      'paymentMode': instance.paymentMode,
      'billImageUrl': instance.billImageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'project': instance.project,
    };

_$ExpenseProjectImpl _$$ExpenseProjectImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseProjectImpl(
      projectName: json['projectName'] as String,
    );

Map<String, dynamic> _$$ExpenseProjectImplToJson(
        _$ExpenseProjectImpl instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
    };
