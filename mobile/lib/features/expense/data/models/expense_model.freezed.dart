// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) {
  return _ExpenseModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseModel {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _amountFromJson)
  double get amount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get vendorName => throw _privateConstructorUsedError;
  String get paymentMode => throw _privateConstructorUsedError;
  String? get billImageUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ExpenseProject? get project => throw _privateConstructorUsedError;

  /// Serializes this ExpenseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseModelCopyWith<ExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseModelCopyWith<$Res> {
  factory $ExpenseModelCopyWith(
          ExpenseModel value, $Res Function(ExpenseModel) then) =
      _$ExpenseModelCopyWithImpl<$Res, ExpenseModel>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String userId,
      DateTime date,
      String category,
      @JsonKey(fromJson: _amountFromJson) double amount,
      String? description,
      String? vendorName,
      String paymentMode,
      String? billImageUrl,
      DateTime createdAt,
      DateTime updatedAt,
      ExpenseProject? project});

  $ExpenseProjectCopyWith<$Res>? get project;
}

/// @nodoc
class _$ExpenseModelCopyWithImpl<$Res, $Val extends ExpenseModel>
    implements $ExpenseModelCopyWith<$Res> {
  _$ExpenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? userId = null,
    Object? date = null,
    Object? category = null,
    Object? amount = null,
    Object? description = freezed,
    Object? vendorName = freezed,
    Object? paymentMode = null,
    Object? billImageUrl = freezed,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String,
      billImageUrl: freezed == billImageUrl
          ? _value.billImageUrl
          : billImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as ExpenseProject?,
    ) as $Val);
  }

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseProjectCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ExpenseProjectCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpenseModelImplCopyWith<$Res>
    implements $ExpenseModelCopyWith<$Res> {
  factory _$$ExpenseModelImplCopyWith(
          _$ExpenseModelImpl value, $Res Function(_$ExpenseModelImpl) then) =
      __$$ExpenseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String userId,
      DateTime date,
      String category,
      @JsonKey(fromJson: _amountFromJson) double amount,
      String? description,
      String? vendorName,
      String paymentMode,
      String? billImageUrl,
      DateTime createdAt,
      DateTime updatedAt,
      ExpenseProject? project});

  @override
  $ExpenseProjectCopyWith<$Res>? get project;
}

/// @nodoc
class __$$ExpenseModelImplCopyWithImpl<$Res>
    extends _$ExpenseModelCopyWithImpl<$Res, _$ExpenseModelImpl>
    implements _$$ExpenseModelImplCopyWith<$Res> {
  __$$ExpenseModelImplCopyWithImpl(
      _$ExpenseModelImpl _value, $Res Function(_$ExpenseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? userId = null,
    Object? date = null,
    Object? category = null,
    Object? amount = null,
    Object? description = freezed,
    Object? vendorName = freezed,
    Object? paymentMode = null,
    Object? billImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? project = freezed,
  }) {
    return _then(_$ExpenseModelImpl(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String,
      billImageUrl: freezed == billImageUrl
          ? _value.billImageUrl
          : billImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as ExpenseProject?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseModelImpl implements _ExpenseModel {
  const _$ExpenseModelImpl(
      {required this.id,
      required this.projectId,
      required this.userId,
      required this.date,
      required this.category,
      @JsonKey(fromJson: _amountFromJson) required this.amount,
      this.description,
      this.vendorName,
      required this.paymentMode,
      this.billImageUrl,
      required this.createdAt,
      required this.updatedAt,
      this.project});

  factory _$ExpenseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String userId;
  @override
  final DateTime date;
  @override
  final String category;
  @override
  @JsonKey(fromJson: _amountFromJson)
  final double amount;
  @override
  final String? description;
  @override
  final String? vendorName;
  @override
  final String paymentMode;
  @override
  final String? billImageUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final ExpenseProject? project;

  @override
  String toString() {
    return 'ExpenseModel(id: $id, projectId: $projectId, userId: $userId, date: $date, category: $category, amount: $amount, description: $description, vendorName: $vendorName, paymentMode: $paymentMode, billImageUrl: $billImageUrl, createdAt: $createdAt, updatedAt: $updatedAt, project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.billImageUrl, billImageUrl) ||
                other.billImageUrl == billImageUrl) &&
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
      category,
      amount,
      description,
      vendorName,
      paymentMode,
      billImageUrl,
      createdAt,
      updatedAt,
      project);

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseModelImplCopyWith<_$ExpenseModelImpl> get copyWith =>
      __$$ExpenseModelImplCopyWithImpl<_$ExpenseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseModelImplToJson(
      this,
    );
  }
}

abstract class _ExpenseModel implements ExpenseModel {
  const factory _ExpenseModel(
      {required final String id,
      required final String projectId,
      required final String userId,
      required final DateTime date,
      required final String category,
      @JsonKey(fromJson: _amountFromJson) required final double amount,
      final String? description,
      final String? vendorName,
      required final String paymentMode,
      final String? billImageUrl,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final ExpenseProject? project}) = _$ExpenseModelImpl;

  factory _ExpenseModel.fromJson(Map<String, dynamic> json) =
      _$ExpenseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  String get category;
  @override
  @JsonKey(fromJson: _amountFromJson)
  double get amount;
  @override
  String? get description;
  @override
  String? get vendorName;
  @override
  String get paymentMode;
  @override
  String? get billImageUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  ExpenseProject? get project;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseModelImplCopyWith<_$ExpenseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseProject _$ExpenseProjectFromJson(Map<String, dynamic> json) {
  return _ExpenseProject.fromJson(json);
}

/// @nodoc
mixin _$ExpenseProject {
  String get projectName => throw _privateConstructorUsedError;

  /// Serializes this ExpenseProject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseProjectCopyWith<ExpenseProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseProjectCopyWith<$Res> {
  factory $ExpenseProjectCopyWith(
          ExpenseProject value, $Res Function(ExpenseProject) then) =
      _$ExpenseProjectCopyWithImpl<$Res, ExpenseProject>;
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class _$ExpenseProjectCopyWithImpl<$Res, $Val extends ExpenseProject>
    implements $ExpenseProjectCopyWith<$Res> {
  _$ExpenseProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseProject
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
abstract class _$$ExpenseProjectImplCopyWith<$Res>
    implements $ExpenseProjectCopyWith<$Res> {
  factory _$$ExpenseProjectImplCopyWith(_$ExpenseProjectImpl value,
          $Res Function(_$ExpenseProjectImpl) then) =
      __$$ExpenseProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class __$$ExpenseProjectImplCopyWithImpl<$Res>
    extends _$ExpenseProjectCopyWithImpl<$Res, _$ExpenseProjectImpl>
    implements _$$ExpenseProjectImplCopyWith<$Res> {
  __$$ExpenseProjectImplCopyWithImpl(
      _$ExpenseProjectImpl _value, $Res Function(_$ExpenseProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseProject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
  }) {
    return _then(_$ExpenseProjectImpl(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseProjectImpl implements _ExpenseProject {
  const _$ExpenseProjectImpl({required this.projectName});

  factory _$ExpenseProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseProjectImplFromJson(json);

  @override
  final String projectName;

  @override
  String toString() {
    return 'ExpenseProject(projectName: $projectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseProjectImpl &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, projectName);

  /// Create a copy of ExpenseProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseProjectImplCopyWith<_$ExpenseProjectImpl> get copyWith =>
      __$$ExpenseProjectImplCopyWithImpl<_$ExpenseProjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseProjectImplToJson(
      this,
    );
  }
}

abstract class _ExpenseProject implements ExpenseProject {
  const factory _ExpenseProject({required final String projectName}) =
      _$ExpenseProjectImpl;

  factory _ExpenseProject.fromJson(Map<String, dynamic> json) =
      _$ExpenseProjectImpl.fromJson;

  @override
  String get projectName;

  /// Create a copy of ExpenseProject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseProjectImplCopyWith<_$ExpenseProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
