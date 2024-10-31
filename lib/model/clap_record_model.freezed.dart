// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clap_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClapRecord _$ClapRecordFromJson(Map<String, dynamic> json) {
  return _ClapRecord.fromJson(json);
}

/// @nodoc
mixin _$ClapRecord {
  String get userUid => throw _privateConstructorUsedError; // 박수를 누른 사용자 ID
  int get clapCount => throw _privateConstructorUsedError;

  /// Serializes this ClapRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClapRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClapRecordCopyWith<ClapRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClapRecordCopyWith<$Res> {
  factory $ClapRecordCopyWith(
          ClapRecord value, $Res Function(ClapRecord) then) =
      _$ClapRecordCopyWithImpl<$Res, ClapRecord>;
  @useResult
  $Res call({String userUid, int clapCount});
}

/// @nodoc
class _$ClapRecordCopyWithImpl<$Res, $Val extends ClapRecord>
    implements $ClapRecordCopyWith<$Res> {
  _$ClapRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClapRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? clapCount = null,
  }) {
    return _then(_value.copyWith(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      clapCount: null == clapCount
          ? _value.clapCount
          : clapCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClapRecordImplCopyWith<$Res>
    implements $ClapRecordCopyWith<$Res> {
  factory _$$ClapRecordImplCopyWith(
          _$ClapRecordImpl value, $Res Function(_$ClapRecordImpl) then) =
      __$$ClapRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUid, int clapCount});
}

/// @nodoc
class __$$ClapRecordImplCopyWithImpl<$Res>
    extends _$ClapRecordCopyWithImpl<$Res, _$ClapRecordImpl>
    implements _$$ClapRecordImplCopyWith<$Res> {
  __$$ClapRecordImplCopyWithImpl(
      _$ClapRecordImpl _value, $Res Function(_$ClapRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClapRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? clapCount = null,
  }) {
    return _then(_$ClapRecordImpl(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      clapCount: null == clapCount
          ? _value.clapCount
          : clapCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClapRecordImpl implements _ClapRecord {
  const _$ClapRecordImpl({required this.userUid, required this.clapCount});

  factory _$ClapRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClapRecordImplFromJson(json);

  @override
  final String userUid;
// 박수를 누른 사용자 ID
  @override
  final int clapCount;

  @override
  String toString() {
    return 'ClapRecord(userUid: $userUid, clapCount: $clapCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClapRecordImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.clapCount, clapCount) ||
                other.clapCount == clapCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userUid, clapCount);

  /// Create a copy of ClapRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClapRecordImplCopyWith<_$ClapRecordImpl> get copyWith =>
      __$$ClapRecordImplCopyWithImpl<_$ClapRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClapRecordImplToJson(
      this,
    );
  }
}

abstract class _ClapRecord implements ClapRecord {
  const factory _ClapRecord(
      {required final String userUid,
      required final int clapCount}) = _$ClapRecordImpl;

  factory _ClapRecord.fromJson(Map<String, dynamic> json) =
      _$ClapRecordImpl.fromJson;

  @override
  String get userUid; // 박수를 누른 사용자 ID
  @override
  int get clapCount;

  /// Create a copy of ClapRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClapRecordImplCopyWith<_$ClapRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
