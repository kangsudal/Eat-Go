// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeReport _$RecipeReportFromJson(Map<String, dynamic> json) {
  return _RecipeReport.fromJson(json);
}

/// @nodoc
mixin _$RecipeReport {
  String get reportId => throw _privateConstructorUsedError;
  String get reportedBy => throw _privateConstructorUsedError; //신고한 사용자 ID
  String get recipeId => throw _privateConstructorUsedError; //신고된 게시물(레시피) ID
  String get reportReason => throw _privateConstructorUsedError; //신고 사유
  @TimestampConverter()
  DateTime get reportedAt => throw _privateConstructorUsedError; //신고일시
  ReportStatus get status => throw _privateConstructorUsedError;

  /// Serializes this RecipeReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeReportCopyWith<RecipeReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeReportCopyWith<$Res> {
  factory $RecipeReportCopyWith(
          RecipeReport value, $Res Function(RecipeReport) then) =
      _$RecipeReportCopyWithImpl<$Res, RecipeReport>;
  @useResult
  $Res call(
      {String reportId,
      String reportedBy,
      String recipeId,
      String reportReason,
      @TimestampConverter() DateTime reportedAt,
      ReportStatus status});
}

/// @nodoc
class _$RecipeReportCopyWithImpl<$Res, $Val extends RecipeReport>
    implements $RecipeReportCopyWith<$Res> {
  _$RecipeReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? reportedBy = null,
    Object? recipeId = null,
    Object? reportReason = null,
    Object? reportedAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      reportedBy: null == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String,
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      reportReason: null == reportReason
          ? _value.reportReason
          : reportReason // ignore: cast_nullable_to_non_nullable
              as String,
      reportedAt: null == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeReportImplCopyWith<$Res>
    implements $RecipeReportCopyWith<$Res> {
  factory _$$RecipeReportImplCopyWith(
          _$RecipeReportImpl value, $Res Function(_$RecipeReportImpl) then) =
      __$$RecipeReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reportId,
      String reportedBy,
      String recipeId,
      String reportReason,
      @TimestampConverter() DateTime reportedAt,
      ReportStatus status});
}

/// @nodoc
class __$$RecipeReportImplCopyWithImpl<$Res>
    extends _$RecipeReportCopyWithImpl<$Res, _$RecipeReportImpl>
    implements _$$RecipeReportImplCopyWith<$Res> {
  __$$RecipeReportImplCopyWithImpl(
      _$RecipeReportImpl _value, $Res Function(_$RecipeReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? reportedBy = null,
    Object? recipeId = null,
    Object? reportReason = null,
    Object? reportedAt = null,
    Object? status = null,
  }) {
    return _then(_$RecipeReportImpl(
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      reportedBy: null == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String,
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      reportReason: null == reportReason
          ? _value.reportReason
          : reportReason // ignore: cast_nullable_to_non_nullable
              as String,
      reportedAt: null == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeReportImpl implements _RecipeReport {
  const _$RecipeReportImpl(
      {required this.reportId,
      required this.reportedBy,
      required this.recipeId,
      required this.reportReason,
      @TimestampConverter() required this.reportedAt,
      required this.status});

  factory _$RecipeReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeReportImplFromJson(json);

  @override
  final String reportId;
  @override
  final String reportedBy;
//신고한 사용자 ID
  @override
  final String recipeId;
//신고된 게시물(레시피) ID
  @override
  final String reportReason;
//신고 사유
  @override
  @TimestampConverter()
  final DateTime reportedAt;
//신고일시
  @override
  final ReportStatus status;

  @override
  String toString() {
    return 'RecipeReport(reportId: $reportId, reportedBy: $reportedBy, recipeId: $recipeId, reportReason: $reportReason, reportedAt: $reportedAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeReportImpl &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId) &&
            (identical(other.reportedBy, reportedBy) ||
                other.reportedBy == reportedBy) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.reportReason, reportReason) ||
                other.reportReason == reportReason) &&
            (identical(other.reportedAt, reportedAt) ||
                other.reportedAt == reportedAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportId, reportedBy, recipeId,
      reportReason, reportedAt, status);

  /// Create a copy of RecipeReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeReportImplCopyWith<_$RecipeReportImpl> get copyWith =>
      __$$RecipeReportImplCopyWithImpl<_$RecipeReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeReportImplToJson(
      this,
    );
  }
}

abstract class _RecipeReport implements RecipeReport {
  const factory _RecipeReport(
      {required final String reportId,
      required final String reportedBy,
      required final String recipeId,
      required final String reportReason,
      @TimestampConverter() required final DateTime reportedAt,
      required final ReportStatus status}) = _$RecipeReportImpl;

  factory _RecipeReport.fromJson(Map<String, dynamic> json) =
      _$RecipeReportImpl.fromJson;

  @override
  String get reportId;
  @override
  String get reportedBy; //신고한 사용자 ID
  @override
  String get recipeId; //신고된 게시물(레시피) ID
  @override
  String get reportReason; //신고 사유
  @override
  @TimestampConverter()
  DateTime get reportedAt; //신고일시
  @override
  ReportStatus get status;

  /// Create a copy of RecipeReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeReportImplCopyWith<_$RecipeReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
