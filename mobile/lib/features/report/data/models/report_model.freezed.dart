// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) {
  return _ReportModel.fromJson(json);
}

/// @nodoc
mixin _$ReportModel {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get workersCount => throw _privateConstructorUsedError;
  String? get workCompleted => throw _privateConstructorUsedError;
  String? get materialsUsed => throw _privateConstructorUsedError;
  String? get issuesFaced => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<String> get sitePhotoUrls => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ReportProject? get project => throw _privateConstructorUsedError;

  /// Serializes this ReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportModelCopyWith<ReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportModelCopyWith<$Res> {
  factory $ReportModelCopyWith(
          ReportModel value, $Res Function(ReportModel) then) =
      _$ReportModelCopyWithImpl<$Res, ReportModel>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String userId,
      DateTime date,
      int workersCount,
      String? workCompleted,
      String? materialsUsed,
      String? issuesFaced,
      String? notes,
      List<String> sitePhotoUrls,
      DateTime createdAt,
      DateTime updatedAt,
      ReportProject? project});

  $ReportProjectCopyWith<$Res>? get project;
}

/// @nodoc
class _$ReportModelCopyWithImpl<$Res, $Val extends ReportModel>
    implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? userId = null,
    Object? date = null,
    Object? workersCount = null,
    Object? workCompleted = freezed,
    Object? materialsUsed = freezed,
    Object? issuesFaced = freezed,
    Object? notes = freezed,
    Object? sitePhotoUrls = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? project = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workersCount: null == workersCount
          ? _value.workersCount
          : workersCount // ignore: cast_nullable_to_non_nullable
              as int,
      workCompleted: freezed == workCompleted
          ? _value.workCompleted
          : workCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
      materialsUsed: freezed == materialsUsed
          ? _value.materialsUsed
          : materialsUsed // ignore: cast_nullable_to_non_nullable
              as String?,
      issuesFaced: freezed == issuesFaced
          ? _value.issuesFaced
          : issuesFaced // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      sitePhotoUrls: null == sitePhotoUrls
          ? _value.sitePhotoUrls
          : sitePhotoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ReportProject?,
    ) as $Val);
  }

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportProjectCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ReportProjectCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportModelImplCopyWith<$Res>
    implements $ReportModelCopyWith<$Res> {
  factory _$$ReportModelImplCopyWith(
          _$ReportModelImpl value, $Res Function(_$ReportModelImpl) then) =
      __$$ReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String userId,
      DateTime date,
      int workersCount,
      String? workCompleted,
      String? materialsUsed,
      String? issuesFaced,
      String? notes,
      List<String> sitePhotoUrls,
      DateTime createdAt,
      DateTime updatedAt,
      ReportProject? project});

  @override
  $ReportProjectCopyWith<$Res>? get project;
}

/// @nodoc
class __$$ReportModelImplCopyWithImpl<$Res>
    extends _$ReportModelCopyWithImpl<$Res, _$ReportModelImpl>
    implements _$$ReportModelImplCopyWith<$Res> {
  __$$ReportModelImplCopyWithImpl(
      _$ReportModelImpl _value, $Res Function(_$ReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? userId = null,
    Object? date = null,
    Object? workersCount = null,
    Object? workCompleted = freezed,
    Object? materialsUsed = freezed,
    Object? issuesFaced = freezed,
    Object? notes = freezed,
    Object? sitePhotoUrls = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? project = freezed,
  }) {
    return _then(_$ReportModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workersCount: null == workersCount
          ? _value.workersCount
          : workersCount // ignore: cast_nullable_to_non_nullable
              as int,
      workCompleted: freezed == workCompleted
          ? _value.workCompleted
          : workCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
      materialsUsed: freezed == materialsUsed
          ? _value.materialsUsed
          : materialsUsed // ignore: cast_nullable_to_non_nullable
              as String?,
      issuesFaced: freezed == issuesFaced
          ? _value.issuesFaced
          : issuesFaced // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      sitePhotoUrls: null == sitePhotoUrls
          ? _value._sitePhotoUrls
          : sitePhotoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ReportProject?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportModelImpl implements _ReportModel {
  const _$ReportModelImpl(
      {required this.id,
      required this.projectId,
      required this.userId,
      required this.date,
      required this.workersCount,
      this.workCompleted,
      this.materialsUsed,
      this.issuesFaced,
      this.notes,
      final List<String> sitePhotoUrls = const <String>[],
      required this.createdAt,
      required this.updatedAt,
      this.project})
      : _sitePhotoUrls = sitePhotoUrls;

  factory _$ReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportModelImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String userId;
  @override
  final DateTime date;
  @override
  final int workersCount;
  @override
  final String? workCompleted;
  @override
  final String? materialsUsed;
  @override
  final String? issuesFaced;
  @override
  final String? notes;
  final List<String> _sitePhotoUrls;
  @override
  @JsonKey()
  List<String> get sitePhotoUrls {
    if (_sitePhotoUrls is EqualUnmodifiableListView) return _sitePhotoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sitePhotoUrls);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final ReportProject? project;

  @override
  String toString() {
    return 'ReportModel(id: $id, projectId: $projectId, userId: $userId, date: $date, workersCount: $workersCount, workCompleted: $workCompleted, materialsUsed: $materialsUsed, issuesFaced: $issuesFaced, notes: $notes, sitePhotoUrls: $sitePhotoUrls, createdAt: $createdAt, updatedAt: $updatedAt, project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.workersCount, workersCount) ||
                other.workersCount == workersCount) &&
            (identical(other.workCompleted, workCompleted) ||
                other.workCompleted == workCompleted) &&
            (identical(other.materialsUsed, materialsUsed) ||
                other.materialsUsed == materialsUsed) &&
            (identical(other.issuesFaced, issuesFaced) ||
                other.issuesFaced == issuesFaced) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._sitePhotoUrls, _sitePhotoUrls) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.project, project) || other.project == project));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      userId,
      date,
      workersCount,
      workCompleted,
      materialsUsed,
      issuesFaced,
      notes,
      const DeepCollectionEquality().hash(_sitePhotoUrls),
      createdAt,
      updatedAt,
      project);

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      __$$ReportModelImplCopyWithImpl<_$ReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportModelImplToJson(
      this,
    );
  }
}

abstract class _ReportModel implements ReportModel {
  const factory _ReportModel(
      {required final String id,
      required final String projectId,
      required final String userId,
      required final DateTime date,
      required final int workersCount,
      final String? workCompleted,
      final String? materialsUsed,
      final String? issuesFaced,
      final String? notes,
      final List<String> sitePhotoUrls,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final ReportProject? project}) = _$ReportModelImpl;

  factory _ReportModel.fromJson(Map<String, dynamic> json) =
      _$ReportModelImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  int get workersCount;
  @override
  String? get workCompleted;
  @override
  String? get materialsUsed;
  @override
  String? get issuesFaced;
  @override
  String? get notes;
  @override
  List<String> get sitePhotoUrls;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  ReportProject? get project;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportProject _$ReportProjectFromJson(Map<String, dynamic> json) {
  return _ReportProject.fromJson(json);
}

/// @nodoc
mixin _$ReportProject {
  String get projectName => throw _privateConstructorUsedError;

  /// Serializes this ReportProject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportProjectCopyWith<ReportProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportProjectCopyWith<$Res> {
  factory $ReportProjectCopyWith(
          ReportProject value, $Res Function(ReportProject) then) =
      _$ReportProjectCopyWithImpl<$Res, ReportProject>;
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class _$ReportProjectCopyWithImpl<$Res, $Val extends ReportProject>
    implements $ReportProjectCopyWith<$Res> {
  _$ReportProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportProject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
  }) {
    return _then(_value.copyWith(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportProjectImplCopyWith<$Res>
    implements $ReportProjectCopyWith<$Res> {
  factory _$$ReportProjectImplCopyWith(
          _$ReportProjectImpl value, $Res Function(_$ReportProjectImpl) then) =
      __$$ReportProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class __$$ReportProjectImplCopyWithImpl<$Res>
    extends _$ReportProjectCopyWithImpl<$Res, _$ReportProjectImpl>
    implements _$$ReportProjectImplCopyWith<$Res> {
  __$$ReportProjectImplCopyWithImpl(
      _$ReportProjectImpl _value, $Res Function(_$ReportProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportProject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
  }) {
    return _then(_$ReportProjectImpl(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportProjectImpl implements _ReportProject {
  const _$ReportProjectImpl({required this.projectName});

  factory _$ReportProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportProjectImplFromJson(json);

  @override
  final String projectName;

  @override
  String toString() {
    return 'ReportProject(projectName: $projectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportProjectImpl &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, projectName);

  /// Create a copy of ReportProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportProjectImplCopyWith<_$ReportProjectImpl> get copyWith =>
      __$$ReportProjectImplCopyWithImpl<_$ReportProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportProjectImplToJson(
      this,
    );
  }
}

abstract class _ReportProject implements ReportProject {
  const factory _ReportProject({required final String projectName}) =
      _$ReportProjectImpl;

  factory _ReportProject.fromJson(Map<String, dynamic> json) =
      _$ReportProjectImpl.fromJson;

  @override
  String get projectName;

  /// Create a copy of ReportProject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportProjectImplCopyWith<_$ReportProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
