// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  String get name => throw _privateConstructorUsedError; // 장소 이름
  List<String> get photoUrls =>
      throw _privateConstructorUsedError; // 이미지 리스트 (URL)
  String get businessStatus => throw _privateConstructorUsedError; // 운영 상태
  double get rating => throw _privateConstructorUsedError; // 평점
  int get priceLevel =>
      throw _privateConstructorUsedError; // 가격대 (0 - 무료, 4 - 매우 비쌈)
  String get website => throw _privateConstructorUsedError; // 웹사이트 URL
  String get placeId => throw _privateConstructorUsedError; // 장소 고유 ID
  String get address => throw _privateConstructorUsedError; // 위치 주소
  String get phoneNumber => throw _privateConstructorUsedError; // 전화번호
  @GeoPointLatLngConverter()
  LatLng get location => throw _privateConstructorUsedError;

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call(
      {String name,
      List<String> photoUrls,
      String businessStatus,
      double rating,
      int priceLevel,
      String website,
      String placeId,
      String address,
      String phoneNumber,
      @GeoPointLatLngConverter() LatLng location});
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? photoUrls = null,
    Object? businessStatus = null,
    Object? rating = null,
    Object? priceLevel = null,
    Object? website = null,
    Object? placeId = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrls: null == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      businessStatus: null == businessStatus
          ? _value.businessStatus
          : businessStatus // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      priceLevel: null == priceLevel
          ? _value.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as int,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
          _$RestaurantImpl value, $Res Function(_$RestaurantImpl) then) =
      __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<String> photoUrls,
      String businessStatus,
      double rating,
      int priceLevel,
      String website,
      String placeId,
      String address,
      String phoneNumber,
      @GeoPointLatLngConverter() LatLng location});
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
      _$RestaurantImpl _value, $Res Function(_$RestaurantImpl) _then)
      : super(_value, _then);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? photoUrls = null,
    Object? businessStatus = null,
    Object? rating = null,
    Object? priceLevel = null,
    Object? website = null,
    Object? placeId = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? location = null,
  }) {
    return _then(_$RestaurantImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrls: null == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      businessStatus: null == businessStatus
          ? _value.businessStatus
          : businessStatus // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      priceLevel: null == priceLevel
          ? _value.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as int,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  const _$RestaurantImpl(
      {required this.name,
      required final List<String> photoUrls,
      required this.businessStatus,
      required this.rating,
      required this.priceLevel,
      required this.website,
      required this.placeId,
      required this.address,
      required this.phoneNumber,
      @GeoPointLatLngConverter() required this.location})
      : _photoUrls = photoUrls;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final String name;
// 장소 이름
  final List<String> _photoUrls;
// 장소 이름
  @override
  List<String> get photoUrls {
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoUrls);
  }

// 이미지 리스트 (URL)
  @override
  final String businessStatus;
// 운영 상태
  @override
  final double rating;
// 평점
  @override
  final int priceLevel;
// 가격대 (0 - 무료, 4 - 매우 비쌈)
  @override
  final String website;
// 웹사이트 URL
  @override
  final String placeId;
// 장소 고유 ID
  @override
  final String address;
// 위치 주소
  @override
  final String phoneNumber;
// 전화번호
  @override
  @GeoPointLatLngConverter()
  final LatLng location;

  @override
  String toString() {
    return 'Restaurant(name: $name, photoUrls: $photoUrls, businessStatus: $businessStatus, rating: $rating, priceLevel: $priceLevel, website: $website, placeId: $placeId, address: $address, phoneNumber: $phoneNumber, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._photoUrls, _photoUrls) &&
            (identical(other.businessStatus, businessStatus) ||
                other.businessStatus == businessStatus) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.priceLevel, priceLevel) ||
                other.priceLevel == priceLevel) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_photoUrls),
      businessStatus,
      rating,
      priceLevel,
      website,
      placeId,
      address,
      phoneNumber,
      location);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant(
          {required final String name,
          required final List<String> photoUrls,
          required final String businessStatus,
          required final double rating,
          required final int priceLevel,
          required final String website,
          required final String placeId,
          required final String address,
          required final String phoneNumber,
          @GeoPointLatLngConverter() required final LatLng location}) =
      _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  String get name; // 장소 이름
  @override
  List<String> get photoUrls; // 이미지 리스트 (URL)
  @override
  String get businessStatus; // 운영 상태
  @override
  double get rating; // 평점
  @override
  int get priceLevel; // 가격대 (0 - 무료, 4 - 매우 비쌈)
  @override
  String get website; // 웹사이트 URL
  @override
  String get placeId; // 장소 고유 ID
  @override
  String get address; // 위치 주소
  @override
  String get phoneNumber; // 전화번호
  @override
  @GeoPointLatLngConverter()
  LatLng get location;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
