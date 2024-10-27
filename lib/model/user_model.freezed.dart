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

EatGoUser _$EatGoUserFromJson(Map<String, dynamic> json) {
  return _EatGoUser.fromJson(json);
}

/// @nodoc
mixin _$EatGoUser {
  String get uid =>
      throw _privateConstructorUsedError; //Apple것도 있으니 @앞에 id보다는 uui로 생성해주는게 나을듯
  String get displayName =>
      throw _privateConstructorUsedError; // displayName: null일때 email id를 사용할 예정. 추후 프로필에서 수정가능하게 만들 예정
  String get email => throw _privateConstructorUsedError;
  double get supportAmount => throw _privateConstructorUsedError; //: 0 //후원 비용
  bool get isPremium => throw _privateConstructorUsedError; //: false //프리미엄 상태
  @TimestampConverter()
  DateTime get premiumExpiration => throw _privateConstructorUsedError;
  List<Bookmark> get bookmarks =>
      throw _privateConstructorUsedError; // 사용자가 북마크한 레시피 목록
  List<String> get clappedRecipes =>
      throw _privateConstructorUsedError; // 사용자가 박수를 친 레시피 ID 목록
  List<String> get recipeReportIds =>
      throw _privateConstructorUsedError; // 사용자 신고한 레시피 목록, 목록에서 차단해주기
  List<Recipe> get blockedRecipes =>
      throw _privateConstructorUsedError; // 레시피 포스트 차단 기능
  bool get pushNotificationEnabled => throw _privateConstructorUsedError;

  /// Serializes this EatGoUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EatGoUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EatGoUserCopyWith<EatGoUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EatGoUserCopyWith<$Res> {
  factory $EatGoUserCopyWith(EatGoUser value, $Res Function(EatGoUser) then) =
      _$EatGoUserCopyWithImpl<$Res, EatGoUser>;
  @useResult
  $Res call(
      {String uid,
      String displayName,
      String email,
      double supportAmount,
      bool isPremium,
      @TimestampConverter() DateTime premiumExpiration,
      List<Bookmark> bookmarks,
      List<String> clappedRecipes,
      List<String> recipeReportIds,
      List<Recipe> blockedRecipes,
      bool pushNotificationEnabled});
}

/// @nodoc
class _$EatGoUserCopyWithImpl<$Res, $Val extends EatGoUser>
    implements $EatGoUserCopyWith<$Res> {
  _$EatGoUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EatGoUser
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
    Object? clappedRecipes = null,
    Object? recipeReportIds = null,
    Object? blockedRecipes = null,
    Object? pushNotificationEnabled = null,
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
      clappedRecipes: null == clappedRecipes
          ? _value.clappedRecipes
          : clappedRecipes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recipeReportIds: null == recipeReportIds
          ? _value.recipeReportIds
          : recipeReportIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedRecipes: null == blockedRecipes
          ? _value.blockedRecipes
          : blockedRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      pushNotificationEnabled: null == pushNotificationEnabled
          ? _value.pushNotificationEnabled
          : pushNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EatGoUserImplCopyWith<$Res>
    implements $EatGoUserCopyWith<$Res> {
  factory _$$EatGoUserImplCopyWith(
          _$EatGoUserImpl value, $Res Function(_$EatGoUserImpl) then) =
      __$$EatGoUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String displayName,
      String email,
      double supportAmount,
      bool isPremium,
      @TimestampConverter() DateTime premiumExpiration,
      List<Bookmark> bookmarks,
      List<String> clappedRecipes,
      List<String> recipeReportIds,
      List<Recipe> blockedRecipes,
      bool pushNotificationEnabled});
}

/// @nodoc
class __$$EatGoUserImplCopyWithImpl<$Res>
    extends _$EatGoUserCopyWithImpl<$Res, _$EatGoUserImpl>
    implements _$$EatGoUserImplCopyWith<$Res> {
  __$$EatGoUserImplCopyWithImpl(
      _$EatGoUserImpl _value, $Res Function(_$EatGoUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of EatGoUser
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
    Object? clappedRecipes = null,
    Object? recipeReportIds = null,
    Object? blockedRecipes = null,
    Object? pushNotificationEnabled = null,
  }) {
    return _then(_$EatGoUserImpl(
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
      clappedRecipes: null == clappedRecipes
          ? _value._clappedRecipes
          : clappedRecipes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recipeReportIds: null == recipeReportIds
          ? _value._recipeReportIds
          : recipeReportIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedRecipes: null == blockedRecipes
          ? _value._blockedRecipes
          : blockedRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      pushNotificationEnabled: null == pushNotificationEnabled
          ? _value.pushNotificationEnabled
          : pushNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EatGoUserImpl implements _EatGoUser {
  const _$EatGoUserImpl(
      {required this.uid,
      required this.displayName,
      required this.email,
      this.supportAmount = 0,
      this.isPremium = false,
      @TimestampConverter() required this.premiumExpiration,
      required final List<Bookmark> bookmarks,
      required final List<String> clappedRecipes,
      required final List<String> recipeReportIds,
      required final List<Recipe> blockedRecipes,
      this.pushNotificationEnabled = true})
      : _bookmarks = bookmarks,
        _clappedRecipes = clappedRecipes,
        _recipeReportIds = recipeReportIds,
        _blockedRecipes = blockedRecipes;

  factory _$EatGoUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$EatGoUserImplFromJson(json);

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
  @TimestampConverter()
  final DateTime premiumExpiration;
  final List<Bookmark> _bookmarks;
  @override
  List<Bookmark> get bookmarks {
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

// 사용자가 북마크한 레시피 목록
  final List<String> _clappedRecipes;
// 사용자가 북마크한 레시피 목록
  @override
  List<String> get clappedRecipes {
    if (_clappedRecipes is EqualUnmodifiableListView) return _clappedRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clappedRecipes);
  }

// 사용자가 박수를 친 레시피 ID 목록
  final List<String> _recipeReportIds;
// 사용자가 박수를 친 레시피 ID 목록
  @override
  List<String> get recipeReportIds {
    if (_recipeReportIds is EqualUnmodifiableListView) return _recipeReportIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeReportIds);
  }

// 사용자 신고한 레시피 목록, 목록에서 차단해주기
  final List<Recipe> _blockedRecipes;
// 사용자 신고한 레시피 목록, 목록에서 차단해주기
  @override
  List<Recipe> get blockedRecipes {
    if (_blockedRecipes is EqualUnmodifiableListView) return _blockedRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedRecipes);
  }

// 레시피 포스트 차단 기능
  @override
  @JsonKey()
  final bool pushNotificationEnabled;

  @override
  String toString() {
    return 'EatGoUser(uid: $uid, displayName: $displayName, email: $email, supportAmount: $supportAmount, isPremium: $isPremium, premiumExpiration: $premiumExpiration, bookmarks: $bookmarks, clappedRecipes: $clappedRecipes, recipeReportIds: $recipeReportIds, blockedRecipes: $blockedRecipes, pushNotificationEnabled: $pushNotificationEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EatGoUserImpl &&
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
                .equals(other._clappedRecipes, _clappedRecipes) &&
            const DeepCollectionEquality()
                .equals(other._recipeReportIds, _recipeReportIds) &&
            const DeepCollectionEquality()
                .equals(other._blockedRecipes, _blockedRecipes) &&
            (identical(
                    other.pushNotificationEnabled, pushNotificationEnabled) ||
                other.pushNotificationEnabled == pushNotificationEnabled));
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
      const DeepCollectionEquality().hash(_clappedRecipes),
      const DeepCollectionEquality().hash(_recipeReportIds),
      const DeepCollectionEquality().hash(_blockedRecipes),
      pushNotificationEnabled);

  /// Create a copy of EatGoUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EatGoUserImplCopyWith<_$EatGoUserImpl> get copyWith =>
      __$$EatGoUserImplCopyWithImpl<_$EatGoUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EatGoUserImplToJson(
      this,
    );
  }
}

abstract class _EatGoUser implements EatGoUser {
  const factory _EatGoUser(
      {required final String uid,
      required final String displayName,
      required final String email,
      final double supportAmount,
      final bool isPremium,
      @TimestampConverter() required final DateTime premiumExpiration,
      required final List<Bookmark> bookmarks,
      required final List<String> clappedRecipes,
      required final List<String> recipeReportIds,
      required final List<Recipe> blockedRecipes,
      final bool pushNotificationEnabled}) = _$EatGoUserImpl;

  factory _EatGoUser.fromJson(Map<String, dynamic> json) =
      _$EatGoUserImpl.fromJson;

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
  @TimestampConverter()
  DateTime get premiumExpiration;
  @override
  List<Bookmark> get bookmarks; // 사용자가 북마크한 레시피 목록
  @override
  List<String> get clappedRecipes; // 사용자가 박수를 친 레시피 ID 목록
  @override
  List<String> get recipeReportIds; // 사용자 신고한 레시피 목록, 목록에서 차단해주기
  @override
  List<Recipe> get blockedRecipes; // 레시피 포스트 차단 기능
  @override
  bool get pushNotificationEnabled;

  /// Create a copy of EatGoUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EatGoUserImplCopyWith<_$EatGoUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
