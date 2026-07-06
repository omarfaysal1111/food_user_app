// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RestaurantDto {

 String get id; String? get name; String? get cuisineType; String? get coverImageUrl; double? get rating; int? get deliveryTimeMin; int? get deliveryTimeMax; double? get deliveryFee; bool? get isFavorited;
/// Create a copy of RestaurantDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantDtoCopyWith<RestaurantDto> get copyWith => _$RestaurantDtoCopyWithImpl<RestaurantDto>(this as RestaurantDto, _$identity);

  /// Serializes this RestaurantDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cuisineType, cuisineType) || other.cuisineType == cuisineType)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.deliveryTimeMin, deliveryTimeMin) || other.deliveryTimeMin == deliveryTimeMin)&&(identical(other.deliveryTimeMax, deliveryTimeMax) || other.deliveryTimeMax == deliveryTimeMax)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cuisineType,coverImageUrl,rating,deliveryTimeMin,deliveryTimeMax,deliveryFee,isFavorited);

@override
String toString() {
  return 'RestaurantDto(id: $id, name: $name, cuisineType: $cuisineType, coverImageUrl: $coverImageUrl, rating: $rating, deliveryTimeMin: $deliveryTimeMin, deliveryTimeMax: $deliveryTimeMax, deliveryFee: $deliveryFee, isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class $RestaurantDtoCopyWith<$Res>  {
  factory $RestaurantDtoCopyWith(RestaurantDto value, $Res Function(RestaurantDto) _then) = _$RestaurantDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? cuisineType, String? coverImageUrl, double? rating, int? deliveryTimeMin, int? deliveryTimeMax, double? deliveryFee, bool? isFavorited
});




}
/// @nodoc
class _$RestaurantDtoCopyWithImpl<$Res>
    implements $RestaurantDtoCopyWith<$Res> {
  _$RestaurantDtoCopyWithImpl(this._self, this._then);

  final RestaurantDto _self;
  final $Res Function(RestaurantDto) _then;

/// Create a copy of RestaurantDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? cuisineType = freezed,Object? coverImageUrl = freezed,Object? rating = freezed,Object? deliveryTimeMin = freezed,Object? deliveryTimeMax = freezed,Object? deliveryFee = freezed,Object? isFavorited = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,cuisineType: freezed == cuisineType ? _self.cuisineType : cuisineType // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,deliveryTimeMin: freezed == deliveryTimeMin ? _self.deliveryTimeMin : deliveryTimeMin // ignore: cast_nullable_to_non_nullable
as int?,deliveryTimeMax: freezed == deliveryTimeMax ? _self.deliveryTimeMax : deliveryTimeMax // ignore: cast_nullable_to_non_nullable
as int?,deliveryFee: freezed == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double?,isFavorited: freezed == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [RestaurantDto].
extension RestaurantDtoPatterns on RestaurantDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantDto value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantDto value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? cuisineType,  String? coverImageUrl,  double? rating,  int? deliveryTimeMin,  int? deliveryTimeMax,  double? deliveryFee,  bool? isFavorited)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantDto() when $default != null:
return $default(_that.id,_that.name,_that.cuisineType,_that.coverImageUrl,_that.rating,_that.deliveryTimeMin,_that.deliveryTimeMax,_that.deliveryFee,_that.isFavorited);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? cuisineType,  String? coverImageUrl,  double? rating,  int? deliveryTimeMin,  int? deliveryTimeMax,  double? deliveryFee,  bool? isFavorited)  $default,) {final _that = this;
switch (_that) {
case _RestaurantDto():
return $default(_that.id,_that.name,_that.cuisineType,_that.coverImageUrl,_that.rating,_that.deliveryTimeMin,_that.deliveryTimeMax,_that.deliveryFee,_that.isFavorited);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? cuisineType,  String? coverImageUrl,  double? rating,  int? deliveryTimeMin,  int? deliveryTimeMax,  double? deliveryFee,  bool? isFavorited)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantDto() when $default != null:
return $default(_that.id,_that.name,_that.cuisineType,_that.coverImageUrl,_that.rating,_that.deliveryTimeMin,_that.deliveryTimeMax,_that.deliveryFee,_that.isFavorited);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantDto implements RestaurantDto {
  const _RestaurantDto({required this.id, this.name, this.cuisineType, this.coverImageUrl, this.rating, this.deliveryTimeMin, this.deliveryTimeMax, this.deliveryFee, this.isFavorited});
  factory _RestaurantDto.fromJson(Map<String, dynamic> json) => _$RestaurantDtoFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? cuisineType;
@override final  String? coverImageUrl;
@override final  double? rating;
@override final  int? deliveryTimeMin;
@override final  int? deliveryTimeMax;
@override final  double? deliveryFee;
@override final  bool? isFavorited;

/// Create a copy of RestaurantDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantDtoCopyWith<_RestaurantDto> get copyWith => __$RestaurantDtoCopyWithImpl<_RestaurantDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cuisineType, cuisineType) || other.cuisineType == cuisineType)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.deliveryTimeMin, deliveryTimeMin) || other.deliveryTimeMin == deliveryTimeMin)&&(identical(other.deliveryTimeMax, deliveryTimeMax) || other.deliveryTimeMax == deliveryTimeMax)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cuisineType,coverImageUrl,rating,deliveryTimeMin,deliveryTimeMax,deliveryFee,isFavorited);

@override
String toString() {
  return 'RestaurantDto(id: $id, name: $name, cuisineType: $cuisineType, coverImageUrl: $coverImageUrl, rating: $rating, deliveryTimeMin: $deliveryTimeMin, deliveryTimeMax: $deliveryTimeMax, deliveryFee: $deliveryFee, isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class _$RestaurantDtoCopyWith<$Res> implements $RestaurantDtoCopyWith<$Res> {
  factory _$RestaurantDtoCopyWith(_RestaurantDto value, $Res Function(_RestaurantDto) _then) = __$RestaurantDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? cuisineType, String? coverImageUrl, double? rating, int? deliveryTimeMin, int? deliveryTimeMax, double? deliveryFee, bool? isFavorited
});




}
/// @nodoc
class __$RestaurantDtoCopyWithImpl<$Res>
    implements _$RestaurantDtoCopyWith<$Res> {
  __$RestaurantDtoCopyWithImpl(this._self, this._then);

  final _RestaurantDto _self;
  final $Res Function(_RestaurantDto) _then;

/// Create a copy of RestaurantDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? cuisineType = freezed,Object? coverImageUrl = freezed,Object? rating = freezed,Object? deliveryTimeMin = freezed,Object? deliveryTimeMax = freezed,Object? deliveryFee = freezed,Object? isFavorited = freezed,}) {
  return _then(_RestaurantDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,cuisineType: freezed == cuisineType ? _self.cuisineType : cuisineType // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,deliveryTimeMin: freezed == deliveryTimeMin ? _self.deliveryTimeMin : deliveryTimeMin // ignore: cast_nullable_to_non_nullable
as int?,deliveryTimeMax: freezed == deliveryTimeMax ? _self.deliveryTimeMax : deliveryTimeMax // ignore: cast_nullable_to_non_nullable
as int?,deliveryFee: freezed == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double?,isFavorited: freezed == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
