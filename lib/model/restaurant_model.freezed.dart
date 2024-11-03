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
  String get id => throw _privateConstructorUsedError; // 장소 고유 ID
  @JsonKey(fromJson: Restaurant._extractDisplayName)
  String get displayName => throw _privateConstructorUsedError; // 장소 이름
  List<Photo>? get photos =>
      throw _privateConstructorUsedError; // 이미지 리스트 (URL)
  String? get businessStatus => throw _privateConstructorUsedError; // 운영 상태
  @JsonKey(fromJson: Restaurant._parseRating)
  double? get rating => throw _privateConstructorUsedError; // 평점
  @JsonKey(fromJson: Restaurant._parsePriceLevel)
  int? get priceLevel =>
      throw _privateConstructorUsedError; // 가격대 (0 - 무료, 4 - 매우 비쌈)
  String? get websiteUri => throw _privateConstructorUsedError; // 웹사이트 URL
  String get googleMapsUri => throw _privateConstructorUsedError; // 구글 장소 URL
  String get formattedAddress => throw _privateConstructorUsedError; // 위치 주소
// required String nationalPhoneNumber, // 전화번호 location과 같이 request하면 Bad Reespose가 뜨므로 제거했음.
  @MapToLatLngConverter()
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
      {String id,
      @JsonKey(fromJson: Restaurant._extractDisplayName) String displayName,
      List<Photo>? photos,
      String? businessStatus,
      @JsonKey(fromJson: Restaurant._parseRating) double? rating,
      @JsonKey(fromJson: Restaurant._parsePriceLevel) int? priceLevel,
      String? websiteUri,
      String googleMapsUri,
      String formattedAddress,
      @MapToLatLngConverter() LatLng location});
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
    Object? id = null,
    Object? displayName = null,
    Object? photos = freezed,
    Object? businessStatus = freezed,
    Object? rating = freezed,
    Object? priceLevel = freezed,
    Object? websiteUri = freezed,
    Object? googleMapsUri = null,
    Object? formattedAddress = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      businessStatus: freezed == businessStatus
          ? _value.businessStatus
          : businessStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      priceLevel: freezed == priceLevel
          ? _value.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      websiteUri: freezed == websiteUri
          ? _value.websiteUri
          : websiteUri // ignore: cast_nullable_to_non_nullable
              as String?,
      googleMapsUri: null == googleMapsUri
          ? _value.googleMapsUri
          : googleMapsUri // ignore: cast_nullable_to_non_nullable
              as String,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
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
      {String id,
      @JsonKey(fromJson: Restaurant._extractDisplayName) String displayName,
      List<Photo>? photos,
      String? businessStatus,
      @JsonKey(fromJson: Restaurant._parseRating) double? rating,
      @JsonKey(fromJson: Restaurant._parsePriceLevel) int? priceLevel,
      String? websiteUri,
      String googleMapsUri,
      String formattedAddress,
      @MapToLatLngConverter() LatLng location});
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
    Object? id = null,
    Object? displayName = null,
    Object? photos = freezed,
    Object? businessStatus = freezed,
    Object? rating = freezed,
    Object? priceLevel = freezed,
    Object? websiteUri = freezed,
    Object? googleMapsUri = null,
    Object? formattedAddress = null,
    Object? location = null,
  }) {
    return _then(_$RestaurantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      businessStatus: freezed == businessStatus
          ? _value.businessStatus
          : businessStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      priceLevel: freezed == priceLevel
          ? _value.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      websiteUri: freezed == websiteUri
          ? _value.websiteUri
          : websiteUri // ignore: cast_nullable_to_non_nullable
              as String?,
      googleMapsUri: null == googleMapsUri
          ? _value.googleMapsUri
          : googleMapsUri // ignore: cast_nullable_to_non_nullable
              as String,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
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
      {required this.id,
      @JsonKey(fromJson: Restaurant._extractDisplayName)
      required this.displayName,
      final List<Photo>? photos,
      this.businessStatus,
      @JsonKey(fromJson: Restaurant._parseRating) this.rating,
      @JsonKey(fromJson: Restaurant._parsePriceLevel) this.priceLevel,
      this.websiteUri,
      required this.googleMapsUri,
      required this.formattedAddress,
      @MapToLatLngConverter() required this.location})
      : _photos = photos;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final String id;
// 장소 고유 ID
  @override
  @JsonKey(fromJson: Restaurant._extractDisplayName)
  final String displayName;
// 장소 이름
  final List<Photo>? _photos;
// 장소 이름
  @override
  List<Photo>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 이미지 리스트 (URL)
  @override
  final String? businessStatus;
// 운영 상태
  @override
  @JsonKey(fromJson: Restaurant._parseRating)
  final double? rating;
// 평점
  @override
  @JsonKey(fromJson: Restaurant._parsePriceLevel)
  final int? priceLevel;
// 가격대 (0 - 무료, 4 - 매우 비쌈)
  @override
  final String? websiteUri;
// 웹사이트 URL
  @override
  final String googleMapsUri;
// 구글 장소 URL
  @override
  final String formattedAddress;
// 위치 주소
// required String nationalPhoneNumber, // 전화번호 location과 같이 request하면 Bad Reespose가 뜨므로 제거했음.
  @override
  @MapToLatLngConverter()
  final LatLng location;

  @override
  String toString() {
    return 'Restaurant(id: $id, displayName: $displayName, photos: $photos, businessStatus: $businessStatus, rating: $rating, priceLevel: $priceLevel, websiteUri: $websiteUri, googleMapsUri: $googleMapsUri, formattedAddress: $formattedAddress, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.businessStatus, businessStatus) ||
                other.businessStatus == businessStatus) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.priceLevel, priceLevel) ||
                other.priceLevel == priceLevel) &&
            (identical(other.websiteUri, websiteUri) ||
                other.websiteUri == websiteUri) &&
            (identical(other.googleMapsUri, googleMapsUri) ||
                other.googleMapsUri == googleMapsUri) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      displayName,
      const DeepCollectionEquality().hash(_photos),
      businessStatus,
      rating,
      priceLevel,
      websiteUri,
      googleMapsUri,
      formattedAddress,
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
          {required final String id,
          @JsonKey(fromJson: Restaurant._extractDisplayName)
          required final String displayName,
          final List<Photo>? photos,
          final String? businessStatus,
          @JsonKey(fromJson: Restaurant._parseRating) final double? rating,
          @JsonKey(fromJson: Restaurant._parsePriceLevel) final int? priceLevel,
          final String? websiteUri,
          required final String googleMapsUri,
          required final String formattedAddress,
          @MapToLatLngConverter() required final LatLng location}) =
      _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  String get id; // 장소 고유 ID
  @override
  @JsonKey(fromJson: Restaurant._extractDisplayName)
  String get displayName; // 장소 이름
  @override
  List<Photo>? get photos; // 이미지 리스트 (URL)
  @override
  String? get businessStatus; // 운영 상태
  @override
  @JsonKey(fromJson: Restaurant._parseRating)
  double? get rating; // 평점
  @override
  @JsonKey(fromJson: Restaurant._parsePriceLevel)
  int? get priceLevel; // 가격대 (0 - 무료, 4 - 매우 비쌈)
  @override
  String? get websiteUri; // 웹사이트 URL
  @override
  String get googleMapsUri; // 구글 장소 URL
  @override
  String get formattedAddress; // 위치 주소
// required String nationalPhoneNumber, // 전화번호 location과 같이 request하면 Bad Reespose가 뜨므로 제거했음.
  @override
  @MapToLatLngConverter()
  LatLng get location;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
