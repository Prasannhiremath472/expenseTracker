// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get projectName => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get siteAddress => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _amountFromJson, toJson: _amountToJson)
  double get estimatedBudget => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt =>
      throw _privateConstructorUsedError; // Optional fields populated only on the project details endpoint
  @JsonKey(fromJson: _amountFromJsonNullable, toJson: _amountToJson)
  double? get totalExpenses => throw _privateConstructorUsedError;
  @JsonKey(name: '_count')
  ProjectCounts? get counts => throw _privateConstructorUsedError;

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String projectName,
      String clientName,
      String siteAddress,
      DateTime startDate,
      @JsonKey(fromJson: _amountFromJson, toJson: _amountToJson)
      double estimatedBudget,
      String? description,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      @JsonKey(fromJson: _amountFromJsonNullable, toJson: _amountToJson)
      double? totalExpenses,
      @JsonKey(name: '_count') ProjectCounts? counts});

  $ProjectCountsCopyWith<$Res>? get counts;
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? projectName = null,
    Object? clientName = null,
    Object? siteAddress = null,
    Object? startDate = null,
    Object? estimatedBudget = null,
    Object? description = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? totalExpenses = freezed,
    Object? counts = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      siteAddress: null == siteAddress
          ? _value.siteAddress
          : siteAddress // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedBudget: null == estimatedBudget
          ? _value.estimatedBudget
          : estimatedBudget // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalExpenses: freezed == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double?,
      counts: freezed == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as ProjectCounts?,
    ) as $Val);
  }

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCountsCopyWith<$Res>? get counts {
    if (_value.counts == null) {
      return null;
    }

    return $ProjectCountsCopyWith<$Res>(_value.counts!, (value) {
      return _then(_value.copyWith(counts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
          _$ProjectModelImpl value, $Res Function(_$ProjectModelImpl) then) =
      __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String projectName,
      String clientName,
      String siteAddress,
      DateTime startDate,
      @JsonKey(fromJson: _amountFromJson, toJson: _amountToJson)
      double estimatedBudget,
      String? description,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      @JsonKey(fromJson: _amountFromJsonNullable, toJson: _amountToJson)
      double? totalExpenses,
      @JsonKey(name: '_count') ProjectCounts? counts});

  @override
  $ProjectCountsCopyWith<$Res>? get counts;
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
      _$ProjectModelImpl _value, $Res Function(_$ProjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? projectName = null,
    Object? clientName = null,
    Object? siteAddress = null,
    Object? startDate = null,
    Object? estimatedBudget = null,
    Object? description = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? totalExpenses = freezed,
    Object? counts = freezed,
  }) {
    return _then(_$ProjectModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      siteAddress: null == siteAddress
          ? _value.siteAddress
          : siteAddress // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedBudget: null == estimatedBudget
          ? _value.estimatedBudget
          : estimatedBudget // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalExpenses: freezed == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double?,
      counts: freezed == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as ProjectCounts?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectModelImpl implements _ProjectModel {
  const _$ProjectModelImpl(
      {required this.id,
      required this.userId,
      required this.projectName,
      required this.clientName,
      required this.siteAddress,
      required this.startDate,
      @JsonKey(fromJson: _amountFromJson, toJson: _amountToJson)
      required this.estimatedBudget,
      this.description,
      this.status = 'ACTIVE',
      required this.createdAt,
      required this.updatedAt,
      @JsonKey(fromJson: _amountFromJsonNullable, toJson: _amountToJson)
      this.totalExpenses,
      @JsonKey(name: '_count') this.counts});

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String projectName;
  @override
  final String clientName;
  @override
  final String siteAddress;
  @override
  final DateTime startDate;
  @override
  @JsonKey(fromJson: _amountFromJson, toJson: _amountToJson)
  final double estimatedBudget;
  @override
  final String? description;
  @override
  @JsonKey()
  final String status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
// Optional fields populated only on the project details endpoint
  @override
  @JsonKey(fromJson: _amountFromJsonNullable, toJson: _amountToJson)
  final double? totalExpenses;
  @override
  @JsonKey(name: '_count')
  final ProjectCounts? counts;

  @override
  String toString() {
    return 'ProjectModel(id: $id, userId: $userId, projectName: $projectName, clientName: $clientName, siteAddress: $siteAddress, startDate: $startDate, estimatedBudget: $estimatedBudget, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, totalExpenses: $totalExpenses, counts: $counts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.siteAddress, siteAddress) ||
                other.siteAddress == siteAddress) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.estimatedBudget, estimatedBudget) ||
                other.estimatedBudget == estimatedBudget) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.counts, counts) || other.counts == counts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      projectName,
      clientName,
      siteAddress,
      startDate,
      estimatedBudget,
      description,
      status,
      createdAt,
      updatedAt,
      totalExpenses,
      counts);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectModel implements ProjectModel {
  const factory _ProjectModel(
          {required final String id,
          required final String userId,
          required final String projectName,
          required final String clientName,
          required final String siteAddress,
          required final DateTime startDate,
          @JsonKey(fromJson: _amountFromJson, toJson: _amountToJson)
          required final double estimatedBudget,
          final String? description,
          final String status,
          required final DateTime createdAt,
          required final DateTime updatedAt,
          @JsonKey(fromJson: _amountFromJsonNullable, toJson: _amountToJson)
          final double? totalExpenses,
          @JsonKey(name: '_count') final ProjectCounts? counts}) =
      _$ProjectModelImpl;

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get projectName;
  @override
  String get clientName;
  @override
  String get siteAddress;
  @override
  DateTime get startDate;
  @override
  @JsonKey(fromJson: _amountFromJson, toJson: _amountToJson)
  double get estimatedBudget;
  @override
  String? get description;
  @override
  String get status;
  @override
  DateTime get createdAt;
  @override
  DateTime
      get updatedAt; // Optional fields populated only on the project details endpoint
  @override
  @JsonKey(fromJson: _amountFromJsonNullable, toJson: _amountToJson)
  double? get totalExpenses;
  @override
  @JsonKey(name: '_count')
  ProjectCounts? get counts;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectCounts _$ProjectCountsFromJson(Map<String, dynamic> json) {
  return _ProjectCounts.fromJson(json);
}

/// @nodoc
mixin _$ProjectCounts {
  int get expenses => throw _privateConstructorUsedError;
  int get dailyReports => throw _privateConstructorUsedError;

  /// Serializes this ProjectCounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCountsCopyWith<ProjectCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCountsCopyWith<$Res> {
  factory $ProjectCountsCopyWith(
          ProjectCounts value, $Res Function(ProjectCounts) then) =
      _$ProjectCountsCopyWithImpl<$Res, ProjectCounts>;
  @useResult
  $Res call({int expenses, int dailyReports});
}

/// @nodoc
class _$ProjectCountsCopyWithImpl<$Res, $Val extends ProjectCounts>
    implements $ProjectCountsCopyWith<$Res> {
  _$ProjectCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? dailyReports = null,
  }) {
    return _then(_value.copyWith(
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as int,
      dailyReports: null == dailyReports
          ? _value.dailyReports
          : dailyReports // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectCountsImplCopyWith<$Res>
    implements $ProjectCountsCopyWith<$Res> {
  factory _$$ProjectCountsImplCopyWith(
          _$ProjectCountsImpl value, $Res Function(_$ProjectCountsImpl) then) =
      __$$ProjectCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int expenses, int dailyReports});
}

/// @nodoc
class __$$ProjectCountsImplCopyWithImpl<$Res>
    extends _$ProjectCountsCopyWithImpl<$Res, _$ProjectCountsImpl>
    implements _$$ProjectCountsImplCopyWith<$Res> {
  __$$ProjectCountsImplCopyWithImpl(
      _$ProjectCountsImpl _value, $Res Function(_$ProjectCountsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? dailyReports = null,
  }) {
    return _then(_$ProjectCountsImpl(
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as int,
      dailyReports: null == dailyReports
          ? _value.dailyReports
          : dailyReports // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectCountsImpl implements _ProjectCounts {
  const _$ProjectCountsImpl({this.expenses = 0, this.dailyReports = 0});

  factory _$ProjectCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectCountsImplFromJson(json);

  @override
  @JsonKey()
  final int expenses;
  @override
  @JsonKey()
  final int dailyReports;

  @override
  String toString() {
    return 'ProjectCounts(expenses: $expenses, dailyReports: $dailyReports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectCountsImpl &&
            (identical(other.expenses, expenses) ||
                other.expenses == expenses) &&
            (identical(other.dailyReports, dailyReports) ||
                other.dailyReports == dailyReports));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, expenses, dailyReports);

  /// Create a copy of ProjectCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectCountsImplCopyWith<_$ProjectCountsImpl> get copyWith =>
      __$$ProjectCountsImplCopyWithImpl<_$ProjectCountsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectCountsImplToJson(
      this,
    );
  }
}

abstract class _ProjectCounts implements ProjectCounts {
  const factory _ProjectCounts({final int expenses, final int dailyReports}) =
      _$ProjectCountsImpl;

  factory _ProjectCounts.fromJson(Map<String, dynamic> json) =
      _$ProjectCountsImpl.fromJson;

  @override
  int get expenses;
  @override
  int get dailyReports;

  /// Create a copy of ProjectCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectCountsImplCopyWith<_$ProjectCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
