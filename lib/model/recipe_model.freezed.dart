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
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get createdBy =>
      throw _privateConstructorUsedError; //currentUser.uid:'식품의약품안전처'.uid, //사용자 UID 또는 시스템
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<AdoptRecord> get adoptedBy =>
      throw _privateConstructorUsedError; //이 레시피가 채택된 기록 (채택된 시간, 채택된 유저 id)
  List<BookmarkRecord> get bookmarkedBy =>
      throw _privateConstructorUsedError; //이 레시피를 북마크한 유저 리스트
  List<ViewRecord> get viewedBy => throw _privateConstructorUsedError;

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
      DateTime createdAt,
      String createdBy,
      DateTime updatedAt,
      List<AdoptRecord> adoptedBy,
      List<BookmarkRecord> bookmarkedBy,
      List<ViewRecord> viewedBy});
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
    Object? adoptedBy = null,
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
      adoptedBy: null == adoptedBy
          ? _value.adoptedBy
          : adoptedBy // ignore: cast_nullable_to_non_nullable
              as List<AdoptRecord>,
      bookmarkedBy: null == bookmarkedBy
          ? _value.bookmarkedBy
          : bookmarkedBy // ignore: cast_nullable_to_non_nullable
              as List<BookmarkRecord>,
      viewedBy: null == viewedBy
          ? _value.viewedBy
          : viewedBy // ignore: cast_nullable_to_non_nullable
              as List<ViewRecord>,
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
      DateTime createdAt,
      String createdBy,
      DateTime updatedAt,
      List<AdoptRecord> adoptedBy,
      List<BookmarkRecord> bookmarkedBy,
      List<ViewRecord> viewedBy});
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
    Object? adoptedBy = null,
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
      adoptedBy: null == adoptedBy
          ? _value._adoptedBy
          : adoptedBy // ignore: cast_nullable_to_non_nullable
              as List<AdoptRecord>,
      bookmarkedBy: null == bookmarkedBy
          ? _value._bookmarkedBy
          : bookmarkedBy // ignore: cast_nullable_to_non_nullable
              as List<BookmarkRecord>,
      viewedBy: null == viewedBy
          ? _value._viewedBy
          : viewedBy // ignore: cast_nullable_to_non_nullable
              as List<ViewRecord>,
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
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required final List<AdoptRecord> adoptedBy,
      required final List<BookmarkRecord> bookmarkedBy,
      required final List<ViewRecord> viewedBy})
      : _descriptions = descriptions,
        _adoptedBy = adoptedBy,
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
  final DateTime createdAt;
  @override
  final String createdBy;
//currentUser.uid:'식품의약품안전처'.uid, //사용자 UID 또는 시스템
  @override
  final DateTime updatedAt;
  final List<AdoptRecord> _adoptedBy;
  @override
  List<AdoptRecord> get adoptedBy {
    if (_adoptedBy is EqualUnmodifiableListView) return _adoptedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adoptedBy);
  }

//이 레시피가 채택된 기록 (채택된 시간, 채택된 유저 id)
  final List<BookmarkRecord> _bookmarkedBy;
//이 레시피가 채택된 기록 (채택된 시간, 채택된 유저 id)
  @override
  List<BookmarkRecord> get bookmarkedBy {
    if (_bookmarkedBy is EqualUnmodifiableListView) return _bookmarkedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarkedBy);
  }

//이 레시피를 북마크한 유저 리스트
  final List<ViewRecord> _viewedBy;
//이 레시피를 북마크한 유저 리스트
  @override
  List<ViewRecord> get viewedBy {
    if (_viewedBy is EqualUnmodifiableListView) return _viewedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewedBy);
  }

  @override
  String toString() {
    return 'Recipe(recipeId: $recipeId, title: $title, ingredients: $ingredients, ingredientsImgUrl: $ingredientsImgUrl, descriptions: $descriptions, category: $category, hashTag: $hashTag, completedImgUrl: $completedImgUrl, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, adoptedBy: $adoptedBy, bookmarkedBy: $bookmarkedBy, viewedBy: $viewedBy)';
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
                .equals(other._adoptedBy, _adoptedBy) &&
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
      const DeepCollectionEquality().hash(_adoptedBy),
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
      required final DateTime createdAt,
      required final String createdBy,
      required final DateTime updatedAt,
      required final List<AdoptRecord> adoptedBy,
      required final List<BookmarkRecord> bookmarkedBy,
      required final List<ViewRecord> viewedBy}) = _$RecipeImpl;

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
  DateTime get createdAt;
  @override
  String get createdBy; //currentUser.uid:'식품의약품안전처'.uid, //사용자 UID 또는 시스템
  @override
  DateTime get updatedAt;
  @override
  List<AdoptRecord> get adoptedBy; //이 레시피가 채택된 기록 (채택된 시간, 채택된 유저 id)
  @override
  List<BookmarkRecord> get bookmarkedBy; //이 레시피를 북마크한 유저 리스트
  @override
  List<ViewRecord> get viewedBy;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
