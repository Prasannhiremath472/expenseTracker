// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardModelImpl _$$DashboardModelImplFromJson(Map<String, dynamic> json) =>
    _$DashboardModelImpl(
      totalProjects: (json['totalProjects'] as num).toInt(),
      activeProjects: (json['activeProjects'] as num).toInt(),
      totalExpenses: _numFromJson(json['totalExpenses']),
      monthlyExpenses: _numFromJson(json['monthlyExpenses']),
      todaysExpenses: _numFromJson(json['todaysExpenses']),
      expenseByCategory: (json['expenseByCategory'] as List<dynamic>)
          .map((e) => CategoryExpense.fromJson(e as Map<String, dynamic>))
          .toList(),
      expenseByMonth: (json['expenseByMonth'] as List<dynamic>)
          .map((e) => MonthlyExpense.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentExpenses: (json['recentExpenses'] as List<dynamic>)
          .map((e) => RecentExpense.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentReports: (json['recentReports'] as List<dynamic>)
          .map((e) => RecentReport.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardModelImplToJson(
        _$DashboardModelImpl instance) =>
    <String, dynamic>{
      'totalProjects': instance.totalProjects,
      'activeProjects': instance.activeProjects,
      'totalExpenses': instance.totalExpenses,
      'monthlyExpenses': instance.monthlyExpenses,
      'todaysExpenses': instance.todaysExpenses,
      'expenseByCategory': instance.expenseByCategory,
      'expenseByMonth': instance.expenseByMonth,
      'recentExpenses': instance.recentExpenses,
      'recentReports': instance.recentReports,
    };

_$CategoryExpenseImpl _$$CategoryExpenseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryExpenseImpl(
      category: json['category'] as String,
      total: _numFromJson(json['total']),
    );

Map<String, dynamic> _$$CategoryExpenseImplToJson(
        _$CategoryExpenseImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'total': instance.total,
    };

_$MonthlyExpenseImpl _$$MonthlyExpenseImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyExpenseImpl(
      month: json['month'] as String,
      total: _numFromJson(json['total']),
    );

Map<String, dynamic> _$$MonthlyExpenseImplToJson(
        _$MonthlyExpenseImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'total': instance.total,
    };

_$RecentExpenseImpl _$$RecentExpenseImplFromJson(Map<String, dynamic> json) =>
    _$RecentExpenseImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      category: json['category'] as String,
      amount: _numFromJson(json['amount']),
      vendorName: json['vendorName'] as String?,
      project: RecentExpenseProject.fromJson(
          json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecentExpenseImplToJson(_$RecentExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'category': instance.category,
      'amount': instance.amount,
      'vendorName': instance.vendorName,
      'project': instance.project,
    };

_$RecentExpenseProjectImpl _$$RecentExpenseProjectImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentExpenseProjectImpl(
      projectName: json['projectName'] as String,
    );

Map<String, dynamic> _$$RecentExpenseProjectImplToJson(
        _$RecentExpenseProjectImpl instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
    };

_$RecentReportImpl _$$RecentReportImplFromJson(Map<String, dynamic> json) =>
    _$RecentReportImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      workersCount: (json['workersCount'] as num).toInt(),
      project: RecentExpenseProject.fromJson(
          json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecentReportImplToJson(_$RecentReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'workersCount': instance.workersCount,
      'project': instance.project,
    };
