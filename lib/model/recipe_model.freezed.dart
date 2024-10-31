// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String get recipeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get ingredients => throw _privateConstructorUsedError;
  String get ingredientsImgUrl => throw _privateConstructorUsedError;
  List<Description> get descriptions => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get hashTag => throw _privateConstructorUsedError;
  String get completedImgUrl => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get createdBy =>
      throw _privateConstructorUsedError; //currentUser.uid:'식품의약품안전처'.uid, //사용자 UID 또는 시스템
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<ClapRecord> get clapRecords =>
      throw _privateConstructorUsedError; //각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
  List<String> get bookmarkedBy =>
      throw _privateConstructorUsedError; //이 레시피를 북마크한 유저 UID 리스트
  List<String> get viewedBy => throw _privateConstructorUsedError;

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String recipeId,
      String title,
      String ingredients,
      String ingredientsImgUrl,
      List<Description> descriptions,
      String category,
      String hashTag,
      String completedImgUrl,
      @TimestampConverter() DateTime createdAt,
      String createdBy,
      @TimestampConverter() DateTime updatedAt,
      List<ClapRecord> clapRecords,
      List<String> bookmarkedBy,
      List<String> viewedBy});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? title = null,
    Object? ingredients = null,
    Object? ingredientsImgUrl = null,
    Object? descriptions = null,
    Object? category = null,
    Object? hashTag = null,
    Object? completedImgUrl = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? clapRecords = null,
    Object? bookmarkedBy = null,
    Object? viewedBy = null,
  }) {
    return _then(_value.copyWith(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      ingredientsImgUrl: null == ingredientsImgUrl
          ? _value.ingredientsImgUrl
          : ingredientsImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<Description>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      hashTag: null == hashTag
          ? _value.hashTag
          : hashTag // ignore: cast_nullable_to_non_nullable
              as String,
      completedImgUrl: null == completedImgUrl
          ? _value.completedImgUrl
          : completedImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clapRecords: null == clapRecords
          ? _value.clapRecords
          : clapRecords // ignore: cast_nullable_to_non_nullable
              as List<ClapRecord>,
      bookmarkedBy: null == bookmarkedBy
          ? _value.bookmarkedBy
          : bookmarkedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      viewedBy: null == viewedBy
          ? _value.viewedBy
          : viewedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String recipeId,
      String title,
      String ingredients,
      String ingredientsImgUrl,
      List<Description> descriptions,
      String category,
      String hashTag,
      String completedImgUrl,
      @TimestampConverter() DateTime createdAt,
      String createdBy,
      @TimestampConverter() DateTime updatedAt,
      List<ClapRecord> clapRecords,
      List<String> bookmarkedBy,
      List<String> viewedBy});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? title = null,
    Object? ingredients = null,
    Object? ingredientsImgUrl = null,
    Object? descriptions = null,
    Object? category = null,
    Object? hashTag = null,
    Object? completedImgUrl = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? clapRecords = null,
    Object? bookmarkedBy = null,
    Object? viewedBy = null,
  }) {
    return _then(_$RecipeImpl(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      ingredientsImgUrl: null == ingredientsImgUrl
          ? _value.ingredientsImgUrl
          : ingredientsImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<Description>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      hashTag: null == hashTag
          ? _value.hashTag
          : hashTag // ignore: cast_nullable_to_non_nullable
              as String,
      completedImgUrl: null == completedImgUrl
          ? _value.completedImgUrl
          : completedImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clapRecords: null == clapRecords
          ? _value._clapRecords
          : clapRecords // ignore: cast_nullable_to_non_nullable
              as List<ClapRecord>,
      bookmarkedBy: null == bookmarkedBy
          ? _value._bookmarkedBy
          : bookmarkedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      viewedBy: null == viewedBy
          ? _value._viewedBy
          : viewedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl(
      {required this.recipeId,
      required this.title,
      required this.ingredients,
      required this.ingredientsImgUrl,
      required final List<Description> descriptions,
      required this.category,
      required this.hashTag,
      required this.completedImgUrl,
      @TimestampConverter() required this.createdAt,
      required this.createdBy,
      @TimestampConverter() required this.updatedAt,
      required final List<ClapRecord> clapRecords,
      required final List<String> bookmarkedBy,
      required final List<String> viewedBy})
      : _descriptions = descriptions,
        _clapRecords = clapRecords,
        _bookmarkedBy = bookmarkedBy,
        _viewedBy = viewedBy;

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final String recipeId;
  @override
  final String title;
  @override
  final String ingredients;
  @override
  final String ingredientsImgUrl;
  final List<Description> _descriptions;
  @override
  List<Description> get descriptions {
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptions);
  }

  @override
  final String category;
  @override
  final String hashTag;
  @override
  final String completedImgUrl;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String createdBy;
//currentUser.uid:'식품의약품안전처'.uid, //사용자 UID 또는 시스템
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  final List<ClapRecord> _clapRecords;
  @override
  List<ClapRecord> get clapRecords {
    if (_clapRecords is EqualUnmodifiableListView) return _clapRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clapRecords);
  }

//각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
  final List<String> _bookmarkedBy;
//각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
  @override
  List<String> get bookmarkedBy {
    if (_bookmarkedBy is EqualUnmodifiableListView) return _bookmarkedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarkedBy);
  }

//이 레시피를 북마크한 유저 UID 리스트
  final List<String> _viewedBy;
//이 레시피를 북마크한 유저 UID 리스트
  @override
  List<String> get viewedBy {
    if (_viewedBy is EqualUnmodifiableListView) return _viewedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewedBy);
  }

  @override
  String toString() {
    return 'Recipe(recipeId: $recipeId, title: $title, ingredients: $ingredients, ingredientsImgUrl: $ingredientsImgUrl, descriptions: $descriptions, category: $category, hashTag: $hashTag, completedImgUrl: $completedImgUrl, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, clapRecords: $clapRecords, bookmarkedBy: $bookmarkedBy, viewedBy: $viewedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            (identical(other.ingredientsImgUrl, ingredientsImgUrl) ||
                other.ingredientsImgUrl == ingredientsImgUrl) &&
            const DeepCollectionEquality()
                .equals(other._descriptions, _descriptions) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.hashTag, hashTag) || other.hashTag == hashTag) &&
            (identical(other.completedImgUrl, completedImgUrl) ||
                other.completedImgUrl == completedImgUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._clapRecords, _clapRecords) &&
            const DeepCollectionEquality()
                .equals(other._bookmarkedBy, _bookmarkedBy) &&
            const DeepCollectionEquality().equals(other._viewedBy, _viewedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      recipeId,
      title,
      ingredients,
      ingredientsImgUrl,
      const DeepCollectionEquality().hash(_descriptions),
      category,
      hashTag,
      completedImgUrl,
      createdAt,
      createdBy,
      updatedAt,
      const DeepCollectionEquality().hash(_clapRecords),
      const DeepCollectionEquality().hash(_bookmarkedBy),
      const DeepCollectionEquality().hash(_viewedBy));

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final String recipeId,
      required final String title,
      required final String ingredients,
      required final String ingredientsImgUrl,
      required final List<Description> descriptions,
      required final String category,
      required final String hashTag,
      required final String completedImgUrl,
      @TimestampConverter() required final DateTime createdAt,
      required final String createdBy,
      @TimestampConverter() required final DateTime updatedAt,
      required final List<ClapRecord> clapRecords,
      required final List<String> bookmarkedBy,
      required final List<String> viewedBy}) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  String get recipeId;
  @override
  String get title;
  @override
  String get ingredients;
  @override
  String get ingredientsImgUrl;
  @override
  List<Description> get descriptions;
  @override
  String get category;
  @override
  String get hashTag;
  @override
  String get completedImgUrl;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  String get createdBy; //currentUser.uid:'식품의약품안전처'.uid, //사용자 UID 또는 시스템
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  List<ClapRecord> get clapRecords; //각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
  @override
  List<String> get bookmarkedBy; //이 레시피를 북마크한 유저 UID 리스트
  @override
  List<String> get viewedBy;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
