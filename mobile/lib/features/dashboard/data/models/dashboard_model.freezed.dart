// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) {
  return _DashboardModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardModel {
  int get totalProjects => throw _privateConstructorUsedError;
  int get activeProjects => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _numFromJson)
  double get totalExpenses => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _numFromJson)
  double get monthlyExpenses => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _numFromJson)
  double get todaysExpenses => throw _privateConstructorUsedError;
  List<CategoryExpense> get expenseByCategory =>
      throw _privateConstructorUsedError;
  List<MonthlyExpense> get expenseByMonth => throw _privateConstructorUsedError;
  List<RecentExpense> get recentExpenses => throw _privateConstructorUsedError;
  List<RecentReport> get recentReports => throw _privateConstructorUsedError;

  /// Serializes this DashboardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardModelCopyWith<DashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardModelCopyWith<$Res> {
  factory $DashboardModelCopyWith(
          DashboardModel value, $Res Function(DashboardModel) then) =
      _$DashboardModelCopyWithImpl<$Res, DashboardModel>;
  @useResult
  $Res call(
      {int totalProjects,
      int activeProjects,
      @JsonKey(fromJson: _numFromJson) double totalExpenses,
      @JsonKey(fromJson: _numFromJson) double monthlyExpenses,
      @JsonKey(fromJson: _numFromJson) double todaysExpenses,
      List<CategoryExpense> expenseByCategory,
      List<MonthlyExpense> expenseByMonth,
      List<RecentExpense> recentExpenses,
      List<RecentReport> recentReports});
}

/// @nodoc
class _$DashboardModelCopyWithImpl<$Res, $Val extends DashboardModel>
    implements $DashboardModelCopyWith<$Res> {
  _$DashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProjects = null,
    Object? activeProjects = null,
    Object? totalExpenses = null,
    Object? monthlyExpenses = null,
    Object? todaysExpenses = null,
    Object? expenseByCategory = null,
    Object? expenseByMonth = null,
    Object? recentExpenses = null,
    Object? recentReports = null,
  }) {
    return _then(_value.copyWith(
      totalProjects: null == totalProjects
          ? _value.totalProjects
          : totalProjects // ignore: cast_nullable_to_non_nullable
              as int,
      activeProjects: null == activeProjects
          ? _value.activeProjects
          : activeProjects // ignore: cast_nullable_to_non_nullable
              as int,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyExpenses: null == monthlyExpenses
          ? _value.monthlyExpenses
          : monthlyExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      todaysExpenses: null == todaysExpenses
          ? _value.todaysExpenses
          : todaysExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      expenseByCategory: null == expenseByCategory
          ? _value.expenseByCategory
          : expenseByCategory // ignore: cast_nullable_to_non_nullable
              as List<CategoryExpense>,
      expenseByMonth: null == expenseByMonth
          ? _value.expenseByMonth
          : expenseByMonth // ignore: cast_nullable_to_non_nullable
              as List<MonthlyExpense>,
      recentExpenses: null == recentExpenses
          ? _value.recentExpenses
          : recentExpenses // ignore: cast_nullable_to_non_nullable
              as List<RecentExpense>,
      recentReports: null == recentReports
          ? _value.recentReports
          : recentReports // ignore: cast_nullable_to_non_nullable
              as List<RecentReport>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardModelImplCopyWith<$Res>
    implements $DashboardModelCopyWith<$Res> {
  factory _$$DashboardModelImplCopyWith(_$DashboardModelImpl value,
          $Res Function(_$DashboardModelImpl) then) =
      __$$DashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalProjects,
      int activeProjects,
      @JsonKey(fromJson: _numFromJson) double totalExpenses,
      @JsonKey(fromJson: _numFromJson) double monthlyExpenses,
      @JsonKey(fromJson: _numFromJson) double todaysExpenses,
      List<CategoryExpense> expenseByCategory,
      List<MonthlyExpense> expenseByMonth,
      List<RecentExpense> recentExpenses,
      List<RecentReport> recentReports});
}

/// @nodoc
class __$$DashboardModelImplCopyWithImpl<$Res>
    extends _$DashboardModelCopyWithImpl<$Res, _$DashboardModelImpl>
    implements _$$DashboardModelImplCopyWith<$Res> {
  __$$DashboardModelImplCopyWithImpl(
      _$DashboardModelImpl _value, $Res Function(_$DashboardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProjects = null,
    Object? activeProjects = null,
    Object? totalExpenses = null,
    Object? monthlyExpenses = null,
    Object? todaysExpenses = null,
    Object? expenseByCategory = null,
    Object? expenseByMonth = null,
    Object? recentExpenses = null,
    Object? recentReports = null,
  }) {
    return _then(_$DashboardModelImpl(
      totalProjects: null == totalProjects
          ? _value.totalProjects
          : totalProjects // ignore: cast_nullable_to_non_nullable
              as int,
      activeProjects: null == activeProjects
          ? _value.activeProjects
          : activeProjects // ignore: cast_nullable_to_non_nullable
              as int,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyExpenses: null == monthlyExpenses
          ? _value.monthlyExpenses
          : monthlyExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      todaysExpenses: null == todaysExpenses
          ? _value.todaysExpenses
          : todaysExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      expenseByCategory: null == expenseByCategory
          ? _value._expenseByCategory
          : expenseByCategory // ignore: cast_nullable_to_non_nullable
              as List<CategoryExpense>,
      expenseByMonth: null == expenseByMonth
          ? _value._expenseByMonth
          : expenseByMonth // ignore: cast_nullable_to_non_nullable
              as List<MonthlyExpense>,
      recentExpenses: null == recentExpenses
          ? _value._recentExpenses
          : recentExpenses // ignore: cast_nullable_to_non_nullable
              as List<RecentExpense>,
      recentReports: null == recentReports
          ? _value._recentReports
          : recentReports // ignore: cast_nullable_to_non_nullable
              as List<RecentReport>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardModelImpl implements _DashboardModel {
  const _$DashboardModelImpl(
      {required this.totalProjects,
      required this.activeProjects,
      @JsonKey(fromJson: _numFromJson) required this.totalExpenses,
      @JsonKey(fromJson: _numFromJson) required this.monthlyExpenses,
      @JsonKey(fromJson: _numFromJson) required this.todaysExpenses,
      required final List<CategoryExpense> expenseByCategory,
      required final List<MonthlyExpense> expenseByMonth,
      required final List<RecentExpense> recentExpenses,
      required final List<RecentReport> recentReports})
      : _expenseByCategory = expenseByCategory,
        _expenseByMonth = expenseByMonth,
        _recentExpenses = recentExpenses,
        _recentReports = recentReports;

  factory _$DashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardModelImplFromJson(json);

  @override
  final int totalProjects;
  @override
  final int activeProjects;
  @override
  @JsonKey(fromJson: _numFromJson)
  final double totalExpenses;
  @override
  @JsonKey(fromJson: _numFromJson)
  final double monthlyExpenses;
  @override
  @JsonKey(fromJson: _numFromJson)
  final double todaysExpenses;
  final List<CategoryExpense> _expenseByCategory;
  @override
  List<CategoryExpense> get expenseByCategory {
    if (_expenseByCategory is EqualUnmodifiableListView)
      return _expenseByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseByCategory);
  }

  final List<MonthlyExpense> _expenseByMonth;
  @override
  List<MonthlyExpense> get expenseByMonth {
    if (_expenseByMonth is EqualUnmodifiableListView) return _expenseByMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseByMonth);
  }

  final List<RecentExpense> _recentExpenses;
  @override
  List<RecentExpense> get recentExpenses {
    if (_recentExpenses is EqualUnmodifiableListView) return _recentExpenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentExpenses);
  }

  final List<RecentReport> _recentReports;
  @override
  List<RecentReport> get recentReports {
    if (_recentReports is EqualUnmodifiableListView) return _recentReports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentReports);
  }

  @override
  String toString() {
    return 'DashboardModel(totalProjects: $totalProjects, activeProjects: $activeProjects, totalExpenses: $totalExpenses, monthlyExpenses: $monthlyExpenses, todaysExpenses: $todaysExpenses, expenseByCategory: $expenseByCategory, expenseByMonth: $expenseByMonth, recentExpenses: $recentExpenses, recentReports: $recentReports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardModelImpl &&
            (identical(other.totalProjects, totalProjects) ||
                other.totalProjects == totalProjects) &&
            (identical(other.activeProjects, activeProjects) ||
                other.activeProjects == activeProjects) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.monthlyExpenses, monthlyExpenses) ||
                other.monthlyExpenses == monthlyExpenses) &&
            (identical(other.todaysExpenses, todaysExpenses) ||
                other.todaysExpenses == todaysExpenses) &&
            const DeepCollectionEquality()
                .equals(other._expenseByCategory, _expenseByCategory) &&
            const DeepCollectionEquality()
                .equals(other._expenseByMonth, _expenseByMonth) &&
            const DeepCollectionEquality()
                .equals(other._recentExpenses, _recentExpenses) &&
            const DeepCollectionEquality()
                .equals(other._recentReports, _recentReports));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalProjects,
      activeProjects,
      totalExpenses,
      monthlyExpenses,
      todaysExpenses,
      const DeepCollectionEquality().hash(_expenseByCategory),
      const DeepCollectionEquality().hash(_expenseByMonth),
      const DeepCollectionEquality().hash(_recentExpenses),
      const DeepCollectionEquality().hash(_recentReports));

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardModelImplCopyWith<_$DashboardModelImpl> get copyWith =>
      __$$DashboardModelImplCopyWithImpl<_$DashboardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardModelImplToJson(
      this,
    );
  }
}

abstract class _DashboardModel implements DashboardModel {
  const factory _DashboardModel(
      {required final int totalProjects,
      required final int activeProjects,
      @JsonKey(fromJson: _numFromJson) required final double totalExpenses,
      @JsonKey(fromJson: _numFromJson) required final double monthlyExpenses,
      @JsonKey(fromJson: _numFromJson) required final double todaysExpenses,
      required final List<CategoryExpense> expenseByCategory,
      required final List<MonthlyExpense> expenseByMonth,
      required final List<RecentExpense> recentExpenses,
      required final List<RecentReport> recentReports}) = _$DashboardModelImpl;

  factory _DashboardModel.fromJson(Map<String, dynamic> json) =
      _$DashboardModelImpl.fromJson;

  @override
  int get totalProjects;
  @override
  int get activeProjects;
  @override
  @JsonKey(fromJson: _numFromJson)
  double get totalExpenses;
  @override
  @JsonKey(fromJson: _numFromJson)
  double get monthlyExpenses;
  @override
  @JsonKey(fromJson: _numFromJson)
  double get todaysExpenses;
  @override
  List<CategoryExpense> get expenseByCategory;
  @override
  List<MonthlyExpense> get expenseByMonth;
  @override
  List<RecentExpense> get recentExpenses;
  @override
  List<RecentReport> get recentReports;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardModelImplCopyWith<_$DashboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryExpense _$CategoryExpenseFromJson(Map<String, dynamic> json) {
  return _CategoryExpense.fromJson(json);
}

/// @nodoc
mixin _$CategoryExpense {
  String get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _numFromJson)
  double get total => throw _privateConstructorUsedError;

  /// Serializes this CategoryExpense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryExpenseCopyWith<CategoryExpense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryExpenseCopyWith<$Res> {
  factory $CategoryExpenseCopyWith(
          CategoryExpense value, $Res Function(CategoryExpense) then) =
      _$CategoryExpenseCopyWithImpl<$Res, CategoryExpense>;
  @useResult
  $Res call({String category, @JsonKey(fromJson: _numFromJson) double total});
}

/// @nodoc
class _$CategoryExpenseCopyWithImpl<$Res, $Val extends CategoryExpense>
    implements $CategoryExpenseCopyWith<$Res> {
  _$CategoryExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryExpenseImplCopyWith<$Res>
    implements $CategoryExpenseCopyWith<$Res> {
  factory _$$CategoryExpenseImplCopyWith(_$CategoryExpenseImpl value,
          $Res Function(_$CategoryExpenseImpl) then) =
      __$$CategoryExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, @JsonKey(fromJson: _numFromJson) double total});
}

/// @nodoc
class __$$CategoryExpenseImplCopyWithImpl<$Res>
    extends _$CategoryExpenseCopyWithImpl<$Res, _$CategoryExpenseImpl>
    implements _$$CategoryExpenseImplCopyWith<$Res> {
  __$$CategoryExpenseImplCopyWithImpl(
      _$CategoryExpenseImpl _value, $Res Function(_$CategoryExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? total = null,
  }) {
    return _then(_$CategoryExpenseImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryExpenseImpl implements _CategoryExpense {
  const _$CategoryExpenseImpl(
      {required this.category,
      @JsonKey(fromJson: _numFromJson) required this.total});

  factory _$CategoryExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryExpenseImplFromJson(json);

  @override
  final String category;
  @override
  @JsonKey(fromJson: _numFromJson)
  final double total;

  @override
  String toString() {
    return 'CategoryExpense(category: $category, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryExpenseImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, total);

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryExpenseImplCopyWith<_$CategoryExpenseImpl> get copyWith =>
      __$$CategoryExpenseImplCopyWithImpl<_$CategoryExpenseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryExpenseImplToJson(
      this,
    );
  }
}

abstract class _CategoryExpense implements CategoryExpense {
  const factory _CategoryExpense(
          {required final String category,
          @JsonKey(fromJson: _numFromJson) required final double total}) =
      _$CategoryExpenseImpl;

  factory _CategoryExpense.fromJson(Map<String, dynamic> json) =
      _$CategoryExpenseImpl.fromJson;

  @override
  String get category;
  @override
  @JsonKey(fromJson: _numFromJson)
  double get total;

  /// Create a copy of CategoryExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryExpenseImplCopyWith<_$CategoryExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyExpense _$MonthlyExpenseFromJson(Map<String, dynamic> json) {
  return _MonthlyExpense.fromJson(json);
}

/// @nodoc
mixin _$MonthlyExpense {
  String get month => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _numFromJson)
  double get total => throw _privateConstructorUsedError;

  /// Serializes this MonthlyExpense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyExpenseCopyWith<MonthlyExpense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyExpenseCopyWith<$Res> {
  factory $MonthlyExpenseCopyWith(
          MonthlyExpense value, $Res Function(MonthlyExpense) then) =
      _$MonthlyExpenseCopyWithImpl<$Res, MonthlyExpense>;
  @useResult
  $Res call({String month, @JsonKey(fromJson: _numFromJson) double total});
}

/// @nodoc
class _$MonthlyExpenseCopyWithImpl<$Res, $Val extends MonthlyExpense>
    implements $MonthlyExpenseCopyWith<$Res> {
  _$MonthlyExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyExpenseImplCopyWith<$Res>
    implements $MonthlyExpenseCopyWith<$Res> {
  factory _$$MonthlyExpenseImplCopyWith(_$MonthlyExpenseImpl value,
          $Res Function(_$MonthlyExpenseImpl) then) =
      __$$MonthlyExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, @JsonKey(fromJson: _numFromJson) double total});
}

/// @nodoc
class __$$MonthlyExpenseImplCopyWithImpl<$Res>
    extends _$MonthlyExpenseCopyWithImpl<$Res, _$MonthlyExpenseImpl>
    implements _$$MonthlyExpenseImplCopyWith<$Res> {
  __$$MonthlyExpenseImplCopyWithImpl(
      _$MonthlyExpenseImpl _value, $Res Function(_$MonthlyExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? total = null,
  }) {
    return _then(_$MonthlyExpenseImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyExpenseImpl implements _MonthlyExpense {
  const _$MonthlyExpenseImpl(
      {required this.month,
      @JsonKey(fromJson: _numFromJson) required this.total});

  factory _$MonthlyExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyExpenseImplFromJson(json);

  @override
  final String month;
  @override
  @JsonKey(fromJson: _numFromJson)
  final double total;

  @override
  String toString() {
    return 'MonthlyExpense(month: $month, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyExpenseImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, total);

  /// Create a copy of MonthlyExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyExpenseImplCopyWith<_$MonthlyExpenseImpl> get copyWith =>
      __$$MonthlyExpenseImplCopyWithImpl<_$MonthlyExpenseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyExpenseImplToJson(
      this,
    );
  }
}

abstract class _MonthlyExpense implements MonthlyExpense {
  const factory _MonthlyExpense(
          {required final String month,
          @JsonKey(fromJson: _numFromJson) required final double total}) =
      _$MonthlyExpenseImpl;

  factory _MonthlyExpense.fromJson(Map<String, dynamic> json) =
      _$MonthlyExpenseImpl.fromJson;

  @override
  String get month;
  @override
  @JsonKey(fromJson: _numFromJson)
  double get total;

  /// Create a copy of MonthlyExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyExpenseImplCopyWith<_$MonthlyExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentExpense _$RecentExpenseFromJson(Map<String, dynamic> json) {
  return _RecentExpense.fromJson(json);
}

/// @nodoc
mixin _$RecentExpense {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _numFromJson)
  double get amount => throw _privateConstructorUsedError;
  String? get vendorName => throw _privateConstructorUsedError;
  RecentExpenseProject get project => throw _privateConstructorUsedError;

  /// Serializes this RecentExpense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentExpenseCopyWith<RecentExpense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentExpenseCopyWith<$Res> {
  factory $RecentExpenseCopyWith(
          RecentExpense value, $Res Function(RecentExpense) then) =
      _$RecentExpenseCopyWithImpl<$Res, RecentExpense>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String category,
      @JsonKey(fromJson: _numFromJson) double amount,
      String? vendorName,
      RecentExpenseProject project});

  $RecentExpenseProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$RecentExpenseCopyWithImpl<$Res, $Val extends RecentExpense>
    implements $RecentExpenseCopyWith<$Res> {
  _$RecentExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? category = null,
    Object? amount = null,
    Object? vendorName = freezed,
    Object? project = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as RecentExpenseProject,
    ) as $Val);
  }

  /// Create a copy of RecentExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecentExpenseProjectCopyWith<$Res> get project {
    return $RecentExpenseProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecentExpenseImplCopyWith<$Res>
    implements $RecentExpenseCopyWith<$Res> {
  factory _$$RecentExpenseImplCopyWith(
          _$RecentExpenseImpl value, $Res Function(_$RecentExpenseImpl) then) =
      __$$RecentExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String category,
      @JsonKey(fromJson: _numFromJson) double amount,
      String? vendorName,
      RecentExpenseProject project});

  @override
  $RecentExpenseProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$RecentExpenseImplCopyWithImpl<$Res>
    extends _$RecentExpenseCopyWithImpl<$Res, _$RecentExpenseImpl>
    implements _$$RecentExpenseImplCopyWith<$Res> {
  __$$RecentExpenseImplCopyWithImpl(
      _$RecentExpenseImpl _value, $Res Function(_$RecentExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? category = null,
    Object? amount = null,
    Object? vendorName = freezed,
    Object? project = null,
  }) {
    return _then(_$RecentExpenseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as RecentExpenseProject,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentExpenseImpl implements _RecentExpense {
  const _$RecentExpenseImpl(
      {required this.id,
      required this.date,
      required this.category,
      @JsonKey(fromJson: _numFromJson) required this.amount,
      this.vendorName,
      required this.project});

  factory _$RecentExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentExpenseImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String category;
  @override
  @JsonKey(fromJson: _numFromJson)
  final double amount;
  @override
  final String? vendorName;
  @override
  final RecentExpenseProject project;

  @override
  String toString() {
    return 'RecentExpense(id: $id, date: $date, category: $category, amount: $amount, vendorName: $vendorName, project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentExpenseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.project, project) || other.project == project));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, category, amount, vendorName, project);

  /// Create a copy of RecentExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentExpenseImplCopyWith<_$RecentExpenseImpl> get copyWith =>
      __$$RecentExpenseImplCopyWithImpl<_$RecentExpenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentExpenseImplToJson(
      this,
    );
  }
}

abstract class _RecentExpense implements RecentExpense {
  const factory _RecentExpense(
      {required final String id,
      required final DateTime date,
      required final String category,
      @JsonKey(fromJson: _numFromJson) required final double amount,
      final String? vendorName,
      required final RecentExpenseProject project}) = _$RecentExpenseImpl;

  factory _RecentExpense.fromJson(Map<String, dynamic> json) =
      _$RecentExpenseImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get category;
  @override
  @JsonKey(fromJson: _numFromJson)
  double get amount;
  @override
  String? get vendorName;
  @override
  RecentExpenseProject get project;

  /// Create a copy of RecentExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentExpenseImplCopyWith<_$RecentExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentExpenseProject _$RecentExpenseProjectFromJson(Map<String, dynamic> json) {
  return _RecentExpenseProject.fromJson(json);
}

/// @nodoc
mixin _$RecentExpenseProject {
  String get projectName => throw _privateConstructorUsedError;

  /// Serializes this RecentExpenseProject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentExpenseProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentExpenseProjectCopyWith<RecentExpenseProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentExpenseProjectCopyWith<$Res> {
  factory $RecentExpenseProjectCopyWith(RecentExpenseProject value,
          $Res Function(RecentExpenseProject) then) =
      _$RecentExpenseProjectCopyWithImpl<$Res, RecentExpenseProject>;
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class _$RecentExpenseProjectCopyWithImpl<$Res,
        $Val extends RecentExpenseProject>
    implements $RecentExpenseProjectCopyWith<$Res> {
  _$RecentExpenseProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentExpenseProject
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
abstract class _$$RecentExpenseProjectImplCopyWith<$Res>
    implements $RecentExpenseProjectCopyWith<$Res> {
  factory _$$RecentExpenseProjectImplCopyWith(_$RecentExpenseProjectImpl value,
          $Res Function(_$RecentExpenseProjectImpl) then) =
      __$$RecentExpenseProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class __$$RecentExpenseProjectImplCopyWithImpl<$Res>
    extends _$RecentExpenseProjectCopyWithImpl<$Res, _$RecentExpenseProjectImpl>
    implements _$$RecentExpenseProjectImplCopyWith<$Res> {
  __$$RecentExpenseProjectImplCopyWithImpl(_$RecentExpenseProjectImpl _value,
      $Res Function(_$RecentExpenseProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentExpenseProject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
  }) {
    return _then(_$RecentExpenseProjectImpl(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentExpenseProjectImpl implements _RecentExpenseProject {
  const _$RecentExpenseProjectImpl({required this.projectName});

  factory _$RecentExpenseProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentExpenseProjectImplFromJson(json);

  @override
  final String projectName;

  @override
  String toString() {
    return 'RecentExpenseProject(projectName: $projectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentExpenseProjectImpl &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, projectName);

  /// Create a copy of RecentExpenseProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentExpenseProjectImplCopyWith<_$RecentExpenseProjectImpl>
      get copyWith =>
          __$$RecentExpenseProjectImplCopyWithImpl<_$RecentExpenseProjectImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentExpenseProjectImplToJson(
      this,
    );
  }
}

abstract class _RecentExpenseProject implements RecentExpenseProject {
  const factory _RecentExpenseProject({required final String projectName}) =
      _$RecentExpenseProjectImpl;

  factory _RecentExpenseProject.fromJson(Map<String, dynamic> json) =
      _$RecentExpenseProjectImpl.fromJson;

  @override
  String get projectName;

  /// Create a copy of RecentExpenseProject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentExpenseProjectImplCopyWith<_$RecentExpenseProjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecentReport _$RecentReportFromJson(Map<String, dynamic> json) {
  return _RecentReport.fromJson(json);
}

/// @nodoc
mixin _$RecentReport {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get workersCount => throw _privateConstructorUsedError;
  RecentExpenseProject get project => throw _privateConstructorUsedError;

  /// Serializes this RecentReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentReportCopyWith<RecentReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentReportCopyWith<$Res> {
  factory $RecentReportCopyWith(
          RecentReport value, $Res Function(RecentReport) then) =
      _$RecentReportCopyWithImpl<$Res, RecentReport>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      int workersCount,
      RecentExpenseProject project});

  $RecentExpenseProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$RecentReportCopyWithImpl<$Res, $Val extends RecentReport>
    implements $RecentReportCopyWith<$Res> {
  _$RecentReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? workersCount = null,
    Object? project = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workersCount: null == workersCount
          ? _value.workersCount
          : workersCount // ignore: cast_nullable_to_non_nullable
              as int,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as RecentExpenseProject,
    ) as $Val);
  }

  /// Create a copy of RecentReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecentExpenseProjectCopyWith<$Res> get project {
    return $RecentExpenseProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecentReportImplCopyWith<$Res>
    implements $RecentReportCopyWith<$Res> {
  factory _$$RecentReportImplCopyWith(
          _$RecentReportImpl value, $Res Function(_$RecentReportImpl) then) =
      __$$RecentReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      int workersCount,
      RecentExpenseProject project});

  @override
  $RecentExpenseProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$RecentReportImplCopyWithImpl<$Res>
    extends _$RecentReportCopyWithImpl<$Res, _$RecentReportImpl>
    implements _$$RecentReportImplCopyWith<$Res> {
  __$$RecentReportImplCopyWithImpl(
      _$RecentReportImpl _value, $Res Function(_$RecentReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? workersCount = null,
    Object? project = null,
  }) {
    return _then(_$RecentReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workersCount: null == workersCount
          ? _value.workersCount
          : workersCount // ignore: cast_nullable_to_non_nullable
              as int,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as RecentExpenseProject,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentReportImpl implements _RecentReport {
  const _$RecentReportImpl(
      {required this.id,
      required this.date,
      required this.workersCount,
      required this.project});

  factory _$RecentReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentReportImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final int workersCount;
  @override
  final RecentExpenseProject project;

  @override
  String toString() {
    return 'RecentReport(id: $id, date: $date, workersCount: $workersCount, project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.workersCount, workersCount) ||
                other.workersCount == workersCount) &&
            (identical(other.project, project) || other.project == project));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, workersCount, project);

  /// Create a copy of RecentReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentReportImplCopyWith<_$RecentReportImpl> get copyWith =>
      __$$RecentReportImplCopyWithImpl<_$RecentReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentReportImplToJson(
      this,
    );
  }
}

abstract class _RecentReport implements RecentReport {
  const factory _RecentReport(
      {required final String id,
      required final DateTime date,
      required final int workersCount,
      required final RecentExpenseProject project}) = _$RecentReportImpl;

  factory _RecentReport.fromJson(Map<String, dynamic> json) =
      _$RecentReportImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  int get workersCount;
  @override
  RecentExpenseProject get project;

  /// Create a copy of RecentReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentReportImplCopyWith<_$RecentReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
