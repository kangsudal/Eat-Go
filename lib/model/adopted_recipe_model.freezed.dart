// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adopted_recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdoptedRecipe _$AdoptedRecipeFromJson(Map<String, dynamic> json) {
  return _AdoptedRecipe.fromJson(json);
}

/// @nodoc
mixin _$AdoptedRecipe {
  String get recipeId => throw _privateConstructorUsedError;
  List<DateTime> get adoptedAt => throw _privateConstructorUsedError;

  /// Serializes this AdoptedRecipe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdoptedRecipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdoptedRecipeCopyWith<AdoptedRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdoptedRecipeCopyWith<$Res> {
  factory $AdoptedRecipeCopyWith(
          AdoptedRecipe value, $Res Function(AdoptedRecipe) then) =
      _$AdoptedRecipeCopyWithImpl<$Res, AdoptedRecipe>;
  @useResult
  $Res call({String recipeId, List<DateTime> adoptedAt});
}

/// @nodoc
class _$AdoptedRecipeCopyWithImpl<$Res, $Val extends AdoptedRecipe>
    implements $AdoptedRecipeCopyWith<$Res> {
  _$AdoptedRecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdoptedRecipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? adoptedAt = null,
  }) {
    return _then(_value.copyWith(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      adoptedAt: null == adoptedAt
          ? _value.adoptedAt
          : adoptedAt // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdoptedRecipeImplCopyWith<$Res>
    implements $AdoptedRecipeCopyWith<$Res> {
  factory _$$AdoptedRecipeImplCopyWith(
          _$AdoptedRecipeImpl value, $Res Function(_$AdoptedRecipeImpl) then) =
      __$$AdoptedRecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String recipeId, List<DateTime> adoptedAt});
}

/// @nodoc
class __$$AdoptedRecipeImplCopyWithImpl<$Res>
    extends _$AdoptedRecipeCopyWithImpl<$Res, _$AdoptedRecipeImpl>
    implements _$$AdoptedRecipeImplCopyWith<$Res> {
  __$$AdoptedRecipeImplCopyWithImpl(
      _$AdoptedRecipeImpl _value, $Res Function(_$AdoptedRecipeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdoptedRecipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? adoptedAt = null,
  }) {
    return _then(_$AdoptedRecipeImpl(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      adoptedAt: null == adoptedAt
          ? _value._adoptedAt
          : adoptedAt // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdoptedRecipeImpl implements _AdoptedRecipe {
  const _$AdoptedRecipeImpl(
      {required this.recipeId, required final List<DateTime> adoptedAt})
      : _adoptedAt = adoptedAt;

  factory _$AdoptedRecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdoptedRecipeImplFromJson(json);

  @override
  final String recipeId;
  final List<DateTime> _adoptedAt;
  @override
  List<DateTime> get adoptedAt {
    if (_adoptedAt is EqualUnmodifiableListView) return _adoptedAt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adoptedAt);
  }

  @override
  String toString() {
    return 'AdoptedRecipe(recipeId: $recipeId, adoptedAt: $adoptedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdoptedRecipeImpl &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            const DeepCollectionEquality()
                .equals(other._adoptedAt, _adoptedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, recipeId, const DeepCollectionEquality().hash(_adoptedAt));

  /// Create a copy of AdoptedRecipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdoptedRecipeImplCopyWith<_$AdoptedRecipeImpl> get copyWith =>
      __$$AdoptedRecipeImplCopyWithImpl<_$AdoptedRecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdoptedRecipeImplToJson(
      this,
    );
  }
}

abstract class _AdoptedRecipe implements AdoptedRecipe {
  const factory _AdoptedRecipe(
      {required final String recipeId,
      required final List<DateTime> adoptedAt}) = _$AdoptedRecipeImpl;

  factory _AdoptedRecipe.fromJson(Map<String, dynamic> json) =
      _$AdoptedRecipeImpl.fromJson;

  @override
  String get recipeId;
  @override
  List<DateTime> get adoptedAt;

  /// Create a copy of AdoptedRecipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdoptedRecipeImplCopyWith<_$AdoptedRecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
