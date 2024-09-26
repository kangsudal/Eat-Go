// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get uid =>
      throw _privateConstructorUsedError; //Apple것도 있으니 @앞에 id보다는 uui로 생성해주는게 나을듯
  String get displayName =>
      throw _privateConstructorUsedError; // displayName: null일때 email id를 사용할 예정. 추후 프로필에서 수정가능하게 만들 예정
  String get email => throw _privateConstructorUsedError;
  double get supportAmount => throw _privateConstructorUsedError; //: 0 //후원 비용
  bool get isPremium => throw _privateConstructorUsedError; //: false //프리미엄 상태
  DateTime get premiumExpiration => throw _privateConstructorUsedError;
  List<Bookmark> get bookmarks =>
      throw _privateConstructorUsedError; // 사용자가 북마크한 레시피 목록
  List<AdoptedRecipe> get adoptedRecipes =>
      throw _privateConstructorUsedError; // 사용자가 채택한 레시피 목록
  List<RecipeReport> get reportedRecipes => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String uid,
      String displayName,
      String email,
      double supportAmount,
      bool isPremium,
      DateTime premiumExpiration,
      List<Bookmark> bookmarks,
      List<AdoptedRecipe> adoptedRecipes,
      List<RecipeReport> reportedRecipes});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? displayName = null,
    Object? email = null,
    Object? supportAmount = null,
    Object? isPremium = null,
    Object? premiumExpiration = null,
    Object? bookmarks = null,
    Object? adoptedRecipes = null,
    Object? reportedRecipes = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      supportAmount: null == supportAmount
          ? _value.supportAmount
          : supportAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      premiumExpiration: null == premiumExpiration
          ? _value.premiumExpiration
          : premiumExpiration // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookmarks: null == bookmarks
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<Bookmark>,
      adoptedRecipes: null == adoptedRecipes
          ? _value.adoptedRecipes
          : adoptedRecipes // ignore: cast_nullable_to_non_nullable
              as List<AdoptedRecipe>,
      reportedRecipes: null == reportedRecipes
          ? _value.reportedRecipes
          : reportedRecipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeReport>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String displayName,
      String email,
      double supportAmount,
      bool isPremium,
      DateTime premiumExpiration,
      List<Bookmark> bookmarks,
      List<AdoptedRecipe> adoptedRecipes,
      List<RecipeReport> reportedRecipes});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? displayName = null,
    Object? email = null,
    Object? supportAmount = null,
    Object? isPremium = null,
    Object? premiumExpiration = null,
    Object? bookmarks = null,
    Object? adoptedRecipes = null,
    Object? reportedRecipes = null,
  }) {
    return _then(_$UserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      supportAmount: null == supportAmount
          ? _value.supportAmount
          : supportAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      premiumExpiration: null == premiumExpiration
          ? _value.premiumExpiration
          : premiumExpiration // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookmarks: null == bookmarks
          ? _value._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<Bookmark>,
      adoptedRecipes: null == adoptedRecipes
          ? _value._adoptedRecipes
          : adoptedRecipes // ignore: cast_nullable_to_non_nullable
              as List<AdoptedRecipe>,
      reportedRecipes: null == reportedRecipes
          ? _value._reportedRecipes
          : reportedRecipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeReport>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.uid,
      required this.displayName,
      required this.email,
      this.supportAmount = 0,
      this.isPremium = false,
      required this.premiumExpiration,
      required final List<Bookmark> bookmarks,
      required final List<AdoptedRecipe> adoptedRecipes,
      required final List<RecipeReport> reportedRecipes})
      : _bookmarks = bookmarks,
        _adoptedRecipes = adoptedRecipes,
        _reportedRecipes = reportedRecipes;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String uid;
//Apple것도 있으니 @앞에 id보다는 uui로 생성해주는게 나을듯
  @override
  final String displayName;
// displayName: null일때 email id를 사용할 예정. 추후 프로필에서 수정가능하게 만들 예정
  @override
  final String email;
  @override
  @JsonKey()
  final double supportAmount;
//: 0 //후원 비용
  @override
  @JsonKey()
  final bool isPremium;
//: false //프리미엄 상태
  @override
  final DateTime premiumExpiration;
  final List<Bookmark> _bookmarks;
  @override
  List<Bookmark> get bookmarks {
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

// 사용자가 북마크한 레시피 목록
  final List<AdoptedRecipe> _adoptedRecipes;
// 사용자가 북마크한 레시피 목록
  @override
  List<AdoptedRecipe> get adoptedRecipes {
    if (_adoptedRecipes is EqualUnmodifiableListView) return _adoptedRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adoptedRecipes);
  }

// 사용자가 채택한 레시피 목록
  final List<RecipeReport> _reportedRecipes;
// 사용자가 채택한 레시피 목록
  @override
  List<RecipeReport> get reportedRecipes {
    if (_reportedRecipes is EqualUnmodifiableListView) return _reportedRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reportedRecipes);
  }

  @override
  String toString() {
    return 'User(uid: $uid, displayName: $displayName, email: $email, supportAmount: $supportAmount, isPremium: $isPremium, premiumExpiration: $premiumExpiration, bookmarks: $bookmarks, adoptedRecipes: $adoptedRecipes, reportedRecipes: $reportedRecipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.supportAmount, supportAmount) ||
                other.supportAmount == supportAmount) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.premiumExpiration, premiumExpiration) ||
                other.premiumExpiration == premiumExpiration) &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks) &&
            const DeepCollectionEquality()
                .equals(other._adoptedRecipes, _adoptedRecipes) &&
            const DeepCollectionEquality()
                .equals(other._reportedRecipes, _reportedRecipes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      displayName,
      email,
      supportAmount,
      isPremium,
      premiumExpiration,
      const DeepCollectionEquality().hash(_bookmarks),
      const DeepCollectionEquality().hash(_adoptedRecipes),
      const DeepCollectionEquality().hash(_reportedRecipes));

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String uid,
      required final String displayName,
      required final String email,
      final double supportAmount,
      final bool isPremium,
      required final DateTime premiumExpiration,
      required final List<Bookmark> bookmarks,
      required final List<AdoptedRecipe> adoptedRecipes,
      required final List<RecipeReport> reportedRecipes}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get uid; //Apple것도 있으니 @앞에 id보다는 uui로 생성해주는게 나을듯
  @override
  String
      get displayName; // displayName: null일때 email id를 사용할 예정. 추후 프로필에서 수정가능하게 만들 예정
  @override
  String get email;
  @override
  double get supportAmount; //: 0 //후원 비용
  @override
  bool get isPremium; //: false //프리미엄 상태
  @override
  DateTime get premiumExpiration;
  @override
  List<Bookmark> get bookmarks; // 사용자가 북마크한 레시피 목록
  @override
  List<AdoptedRecipe> get adoptedRecipes; // 사용자가 채택한 레시피 목록
  @override
  List<RecipeReport> get reportedRecipes;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}