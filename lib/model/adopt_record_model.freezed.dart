// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adopt_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdoptRecord _$AdoptRecordFromJson(Map<String, dynamic> json) {
  return _AdoptRecord.fromJson(json);
}

/// @nodoc
mixin _$AdoptRecord {
  @TimestampConverter()
  DateTime get adoptedAt => throw _privateConstructorUsedError; //채택된 시간
  String get userUid => throw _privateConstructorUsedError;

  /// Serializes this AdoptRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdoptRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdoptRecordCopyWith<AdoptRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdoptRecordCopyWith<$Res> {
  factory $AdoptRecordCopyWith(
          AdoptRecord value, $Res Function(AdoptRecord) then) =
      _$AdoptRecordCopyWithImpl<$Res, AdoptRecord>;
  @useResult
  $Res call({@TimestampConverter() DateTime adoptedAt, String userUid});
}

/// @nodoc
class _$AdoptRecordCopyWithImpl<$Res, $Val extends AdoptRecord>
    implements $AdoptRecordCopyWith<$Res> {
  _$AdoptRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdoptRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adoptedAt = null,
    Object? userUid = null,
  }) {
    return _then(_value.copyWith(
      adoptedAt: null == adoptedAt
          ? _value.adoptedAt
          : adoptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdoptRecordImplCopyWith<$Res>
    implements $AdoptRecordCopyWith<$Res> {
  factory _$$AdoptRecordImplCopyWith(
          _$AdoptRecordImpl value, $Res Function(_$AdoptRecordImpl) then) =
      __$$AdoptRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@TimestampConverter() DateTime adoptedAt, String userUid});
}

/// @nodoc
class __$$AdoptRecordImplCopyWithImpl<$Res>
    extends _$AdoptRecordCopyWithImpl<$Res, _$AdoptRecordImpl>
    implements _$$AdoptRecordImplCopyWith<$Res> {
  __$$AdoptRecordImplCopyWithImpl(
      _$AdoptRecordImpl _value, $Res Function(_$AdoptRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdoptRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adoptedAt = null,
    Object? userUid = null,
  }) {
    return _then(_$AdoptRecordImpl(
      adoptedAt: null == adoptedAt
          ? _value.adoptedAt
          : adoptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdoptRecordImpl implements _AdoptRecord {
  const _$AdoptRecordImpl(
      {@TimestampConverter() required this.adoptedAt, required this.userUid});

  factory _$AdoptRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdoptRecordImplFromJson(json);

  @override
  @TimestampConverter()
  final DateTime adoptedAt;
//채택된 시간
  @override
  final String userUid;

  @override
  String toString() {
    return 'AdoptRecord(adoptedAt: $adoptedAt, userUid: $userUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdoptRecordImpl &&
            (identical(other.adoptedAt, adoptedAt) ||
                other.adoptedAt == adoptedAt) &&
            (identical(other.userUid, userUid) || other.userUid == userUid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, adoptedAt, userUid);

  /// Create a copy of AdoptRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdoptRecordImplCopyWith<_$AdoptRecordImpl> get copyWith =>
      __$$AdoptRecordImplCopyWithImpl<_$AdoptRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdoptRecordImplToJson(
      this,
    );
  }
}

abstract class _AdoptRecord implements AdoptRecord {
  const factory _AdoptRecord(
      {@TimestampConverter() required final DateTime adoptedAt,
      required final String userUid}) = _$AdoptRecordImpl;

  factory _AdoptRecord.fromJson(Map<String, dynamic> json) =
      _$AdoptRecordImpl.fromJson;

  @override
  @TimestampConverter()
  DateTime get adoptedAt; //채택된 시간
  @override
  String get userUid;

  /// Create a copy of AdoptRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdoptRecordImplCopyWith<_$AdoptRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
