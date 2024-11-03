// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return _Photo.fromJson(json);
}

/// @nodoc
mixin _$Photo {
  String get name => throw _privateConstructorUsedError;
  int get widthPx => throw _privateConstructorUsedError;
  int get heightPx => throw _privateConstructorUsedError;
  List<AuthorAttribution> get authorAttributions =>
      throw _privateConstructorUsedError;
  String get flagContentUri => throw _privateConstructorUsedError;
  String get googleMapsUri => throw _privateConstructorUsedError;

  /// Serializes this Photo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoCopyWith<Photo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoCopyWith<$Res> {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) then) =
      _$PhotoCopyWithImpl<$Res, Photo>;
  @useResult
  $Res call(
      {String name,
      int widthPx,
      int heightPx,
      List<AuthorAttribution> authorAttributions,
      String flagContentUri,
      String googleMapsUri});
}

/// @nodoc
class _$PhotoCopyWithImpl<$Res, $Val extends Photo>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? widthPx = null,
    Object? heightPx = null,
    Object? authorAttributions = null,
    Object? flagContentUri = null,
    Object? googleMapsUri = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      widthPx: null == widthPx
          ? _value.widthPx
          : widthPx // ignore: cast_nullable_to_non_nullable
              as int,
      heightPx: null == heightPx
          ? _value.heightPx
          : heightPx // ignore: cast_nullable_to_non_nullable
              as int,
      authorAttributions: null == authorAttributions
          ? _value.authorAttributions
          : authorAttributions // ignore: cast_nullable_to_non_nullable
              as List<AuthorAttribution>,
      flagContentUri: null == flagContentUri
          ? _value.flagContentUri
          : flagContentUri // ignore: cast_nullable_to_non_nullable
              as String,
      googleMapsUri: null == googleMapsUri
          ? _value.googleMapsUri
          : googleMapsUri // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoImplCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$$PhotoImplCopyWith(
          _$PhotoImpl value, $Res Function(_$PhotoImpl) then) =
      __$$PhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int widthPx,
      int heightPx,
      List<AuthorAttribution> authorAttributions,
      String flagContentUri,
      String googleMapsUri});
}

/// @nodoc
class __$$PhotoImplCopyWithImpl<$Res>
    extends _$PhotoCopyWithImpl<$Res, _$PhotoImpl>
    implements _$$PhotoImplCopyWith<$Res> {
  __$$PhotoImplCopyWithImpl(
      _$PhotoImpl _value, $Res Function(_$PhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? widthPx = null,
    Object? heightPx = null,
    Object? authorAttributions = null,
    Object? flagContentUri = null,
    Object? googleMapsUri = null,
  }) {
    return _then(_$PhotoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      widthPx: null == widthPx
          ? _value.widthPx
          : widthPx // ignore: cast_nullable_to_non_nullable
              as int,
      heightPx: null == heightPx
          ? _value.heightPx
          : heightPx // ignore: cast_nullable_to_non_nullable
              as int,
      authorAttributions: null == authorAttributions
          ? _value._authorAttributions
          : authorAttributions // ignore: cast_nullable_to_non_nullable
              as List<AuthorAttribution>,
      flagContentUri: null == flagContentUri
          ? _value.flagContentUri
          : flagContentUri // ignore: cast_nullable_to_non_nullable
              as String,
      googleMapsUri: null == googleMapsUri
          ? _value.googleMapsUri
          : googleMapsUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoImpl implements _Photo {
  const _$PhotoImpl(
      {required this.name,
      required this.widthPx,
      required this.heightPx,
      required final List<AuthorAttribution> authorAttributions,
      required this.flagContentUri,
      required this.googleMapsUri})
      : _authorAttributions = authorAttributions;

  factory _$PhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoImplFromJson(json);

  @override
  final String name;
  @override
  final int widthPx;
  @override
  final int heightPx;
  final List<AuthorAttribution> _authorAttributions;
  @override
  List<AuthorAttribution> get authorAttributions {
    if (_authorAttributions is EqualUnmodifiableListView)
      return _authorAttributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorAttributions);
  }

  @override
  final String flagContentUri;
  @override
  final String googleMapsUri;

  @override
  String toString() {
    return 'Photo(name: $name, widthPx: $widthPx, heightPx: $heightPx, authorAttributions: $authorAttributions, flagContentUri: $flagContentUri, googleMapsUri: $googleMapsUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.widthPx, widthPx) || other.widthPx == widthPx) &&
            (identical(other.heightPx, heightPx) ||
                other.heightPx == heightPx) &&
            const DeepCollectionEquality()
                .equals(other._authorAttributions, _authorAttributions) &&
            (identical(other.flagContentUri, flagContentUri) ||
                other.flagContentUri == flagContentUri) &&
            (identical(other.googleMapsUri, googleMapsUri) ||
                other.googleMapsUri == googleMapsUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      widthPx,
      heightPx,
      const DeepCollectionEquality().hash(_authorAttributions),
      flagContentUri,
      googleMapsUri);

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoImplCopyWith<_$PhotoImpl> get copyWith =>
      __$$PhotoImplCopyWithImpl<_$PhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoImplToJson(
      this,
    );
  }
}

abstract class _Photo implements Photo {
  const factory _Photo(
      {required final String name,
      required final int widthPx,
      required final int heightPx,
      required final List<AuthorAttribution> authorAttributions,
      required final String flagContentUri,
      required final String googleMapsUri}) = _$PhotoImpl;

  factory _Photo.fromJson(Map<String, dynamic> json) = _$PhotoImpl.fromJson;

  @override
  String get name;
  @override
  int get widthPx;
  @override
  int get heightPx;
  @override
  List<AuthorAttribution> get authorAttributions;
  @override
  String get flagContentUri;
  @override
  String get googleMapsUri;

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoImplCopyWith<_$PhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
