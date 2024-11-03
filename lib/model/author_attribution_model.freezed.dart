// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_attribution_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorAttribution _$AuthorAttributionFromJson(Map<String, dynamic> json) {
  return _AuthorAttribution.fromJson(json);
}

/// @nodoc
mixin _$AuthorAttribution {
  String get displayName => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  String get photoUri => throw _privateConstructorUsedError;

  /// Serializes this AuthorAttribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthorAttribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorAttributionCopyWith<AuthorAttribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorAttributionCopyWith<$Res> {
  factory $AuthorAttributionCopyWith(
          AuthorAttribution value, $Res Function(AuthorAttribution) then) =
      _$AuthorAttributionCopyWithImpl<$Res, AuthorAttribution>;
  @useResult
  $Res call({String displayName, String uri, String photoUri});
}

/// @nodoc
class _$AuthorAttributionCopyWithImpl<$Res, $Val extends AuthorAttribution>
    implements $AuthorAttributionCopyWith<$Res> {
  _$AuthorAttributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorAttribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? uri = null,
    Object? photoUri = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      photoUri: null == photoUri
          ? _value.photoUri
          : photoUri // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorAttributionImplCopyWith<$Res>
    implements $AuthorAttributionCopyWith<$Res> {
  factory _$$AuthorAttributionImplCopyWith(_$AuthorAttributionImpl value,
          $Res Function(_$AuthorAttributionImpl) then) =
      __$$AuthorAttributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayName, String uri, String photoUri});
}

/// @nodoc
class __$$AuthorAttributionImplCopyWithImpl<$Res>
    extends _$AuthorAttributionCopyWithImpl<$Res, _$AuthorAttributionImpl>
    implements _$$AuthorAttributionImplCopyWith<$Res> {
  __$$AuthorAttributionImplCopyWithImpl(_$AuthorAttributionImpl _value,
      $Res Function(_$AuthorAttributionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorAttribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? uri = null,
    Object? photoUri = null,
  }) {
    return _then(_$AuthorAttributionImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      photoUri: null == photoUri
          ? _value.photoUri
          : photoUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorAttributionImpl implements _AuthorAttribution {
  const _$AuthorAttributionImpl(
      {required this.displayName, required this.uri, required this.photoUri});

  factory _$AuthorAttributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorAttributionImplFromJson(json);

  @override
  final String displayName;
  @override
  final String uri;
  @override
  final String photoUri;

  @override
  String toString() {
    return 'AuthorAttribution(displayName: $displayName, uri: $uri, photoUri: $photoUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorAttributionImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.photoUri, photoUri) ||
                other.photoUri == photoUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, uri, photoUri);

  /// Create a copy of AuthorAttribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorAttributionImplCopyWith<_$AuthorAttributionImpl> get copyWith =>
      __$$AuthorAttributionImplCopyWithImpl<_$AuthorAttributionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorAttributionImplToJson(
      this,
    );
  }
}

abstract class _AuthorAttribution implements AuthorAttribution {
  const factory _AuthorAttribution(
      {required final String displayName,
      required final String uri,
      required final String photoUri}) = _$AuthorAttributionImpl;

  factory _AuthorAttribution.fromJson(Map<String, dynamic> json) =
      _$AuthorAttributionImpl.fromJson;

  @override
  String get displayName;
  @override
  String get uri;
  @override
  String get photoUri;

  /// Create a copy of AuthorAttribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorAttributionImplCopyWith<_$AuthorAttributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
