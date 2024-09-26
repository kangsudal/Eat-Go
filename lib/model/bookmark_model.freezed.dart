// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bookmark _$BookmarkFromJson(Map<String, dynamic> json) {
  return _Bookmark.fromJson(json);
}

/// @nodoc
mixin _$Bookmark {
  String get recipeId => throw _privateConstructorUsedError;
  DateTime get bookmarkedAt => throw _privateConstructorUsedError;

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkCopyWith<Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCopyWith<$Res> {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) then) =
      _$BookmarkCopyWithImpl<$Res, Bookmark>;
  @useResult
  $Res call({String recipeId, DateTime bookmarkedAt});
}

/// @nodoc
class _$BookmarkCopyWithImpl<$Res, $Val extends Bookmark>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? bookmarkedAt = null,
  }) {
    return _then(_value.copyWith(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkedAt: null == bookmarkedAt
          ? _value.bookmarkedAt
          : bookmarkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkImplCopyWith<$Res>
    implements $BookmarkCopyWith<$Res> {
  factory _$$BookmarkImplCopyWith(
          _$BookmarkImpl value, $Res Function(_$BookmarkImpl) then) =
      __$$BookmarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String recipeId, DateTime bookmarkedAt});
}

/// @nodoc
class __$$BookmarkImplCopyWithImpl<$Res>
    extends _$BookmarkCopyWithImpl<$Res, _$BookmarkImpl>
    implements _$$BookmarkImplCopyWith<$Res> {
  __$$BookmarkImplCopyWithImpl(
      _$BookmarkImpl _value, $Res Function(_$BookmarkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? bookmarkedAt = null,
  }) {
    return _then(_$BookmarkImpl(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkedAt: null == bookmarkedAt
          ? _value.bookmarkedAt
          : bookmarkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkImpl implements _Bookmark {
  const _$BookmarkImpl({required this.recipeId, required this.bookmarkedAt});

  factory _$BookmarkImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkImplFromJson(json);

  @override
  final String recipeId;
  @override
  final DateTime bookmarkedAt;

  @override
  String toString() {
    return 'Bookmark(recipeId: $recipeId, bookmarkedAt: $bookmarkedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkImpl &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.bookmarkedAt, bookmarkedAt) ||
                other.bookmarkedAt == bookmarkedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, recipeId, bookmarkedAt);

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkImplCopyWith<_$BookmarkImpl> get copyWith =>
      __$$BookmarkImplCopyWithImpl<_$BookmarkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkImplToJson(
      this,
    );
  }
}

abstract class _Bookmark implements Bookmark {
  const factory _Bookmark(
      {required final String recipeId,
      required final DateTime bookmarkedAt}) = _$BookmarkImpl;

  factory _Bookmark.fromJson(Map<String, dynamic> json) =
      _$BookmarkImpl.fromJson;

  @override
  String get recipeId;
  @override
  DateTime get bookmarkedAt;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkImplCopyWith<_$BookmarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
