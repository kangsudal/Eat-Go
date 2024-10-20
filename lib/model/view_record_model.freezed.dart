// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViewRecord _$ViewRecordFromJson(Map<String, dynamic> json) {
  return _ViewRecord.fromJson(json);
}

/// @nodoc
mixin _$ViewRecord {
  String get userUid => throw _privateConstructorUsedError; //조회한 유저 ID
  @TimestampConverter()
  DateTime get viewedAt => throw _privateConstructorUsedError;

  /// Serializes this ViewRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViewRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewRecordCopyWith<ViewRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewRecordCopyWith<$Res> {
  factory $ViewRecordCopyWith(
          ViewRecord value, $Res Function(ViewRecord) then) =
      _$ViewRecordCopyWithImpl<$Res, ViewRecord>;
  @useResult
  $Res call({String userUid, @TimestampConverter() DateTime viewedAt});
}

/// @nodoc
class _$ViewRecordCopyWithImpl<$Res, $Val extends ViewRecord>
    implements $ViewRecordCopyWith<$Res> {
  _$ViewRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? viewedAt = null,
  }) {
    return _then(_value.copyWith(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      viewedAt: null == viewedAt
          ? _value.viewedAt
          : viewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewRecordImplCopyWith<$Res>
    implements $ViewRecordCopyWith<$Res> {
  factory _$$ViewRecordImplCopyWith(
          _$ViewRecordImpl value, $Res Function(_$ViewRecordImpl) then) =
      __$$ViewRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUid, @TimestampConverter() DateTime viewedAt});
}

/// @nodoc
class __$$ViewRecordImplCopyWithImpl<$Res>
    extends _$ViewRecordCopyWithImpl<$Res, _$ViewRecordImpl>
    implements _$$ViewRecordImplCopyWith<$Res> {
  __$$ViewRecordImplCopyWithImpl(
      _$ViewRecordImpl _value, $Res Function(_$ViewRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? viewedAt = null,
  }) {
    return _then(_$ViewRecordImpl(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      viewedAt: null == viewedAt
          ? _value.viewedAt
          : viewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewRecordImpl implements _ViewRecord {
  const _$ViewRecordImpl(
      {required this.userUid, @TimestampConverter() required this.viewedAt});

  factory _$ViewRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewRecordImplFromJson(json);

  @override
  final String userUid;
//조회한 유저 ID
  @override
  @TimestampConverter()
  final DateTime viewedAt;

  @override
  String toString() {
    return 'ViewRecord(userUid: $userUid, viewedAt: $viewedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewRecordImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.viewedAt, viewedAt) ||
                other.viewedAt == viewedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userUid, viewedAt);

  /// Create a copy of ViewRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewRecordImplCopyWith<_$ViewRecordImpl> get copyWith =>
      __$$ViewRecordImplCopyWithImpl<_$ViewRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewRecordImplToJson(
      this,
    );
  }
}

abstract class _ViewRecord implements ViewRecord {
  const factory _ViewRecord(
          {required final String userUid,
          @TimestampConverter() required final DateTime viewedAt}) =
      _$ViewRecordImpl;

  factory _ViewRecord.fromJson(Map<String, dynamic> json) =
      _$ViewRecordImpl.fromJson;

  @override
  String get userUid; //조회한 유저 ID
  @override
  @TimestampConverter()
  DateTime get viewedAt;

  /// Create a copy of ViewRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewRecordImplCopyWith<_$ViewRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
