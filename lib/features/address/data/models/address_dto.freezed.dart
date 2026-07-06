// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressDto {

 String get id; String? get label; String? get fullAddress; double? get lat; double? get lng; String? get city; String? get neighborhood; String? get streetNumber; String? get buildingNumber; String? get floor; String? get apartment; String? get addressType;@JsonKey(name: 'default') bool? get isDefault;
/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<AddressDto> get copyWith => _$AddressDtoCopyWithImpl<AddressDto>(this as AddressDto, _$identity);

  /// Serializes this AddressDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.city, city) || other.city == city)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.streetNumber, streetNumber) || other.streetNumber == streetNumber)&&(identical(other.buildingNumber, buildingNumber) || other.buildingNumber == buildingNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.apartment, apartment) || other.apartment == apartment)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,fullAddress,lat,lng,city,neighborhood,streetNumber,buildingNumber,floor,apartment,addressType,isDefault);

@override
String toString() {
  return 'AddressDto(id: $id, label: $label, fullAddress: $fullAddress, lat: $lat, lng: $lng, city: $city, neighborhood: $neighborhood, streetNumber: $streetNumber, buildingNumber: $buildingNumber, floor: $floor, apartment: $apartment, addressType: $addressType, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $AddressDtoCopyWith<$Res>  {
  factory $AddressDtoCopyWith(AddressDto value, $Res Function(AddressDto) _then) = _$AddressDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? label, String? fullAddress, double? lat, double? lng, String? city, String? neighborhood, String? streetNumber, String? buildingNumber, String? floor, String? apartment, String? addressType,@JsonKey(name: 'default') bool? isDefault
});




}
/// @nodoc
class _$AddressDtoCopyWithImpl<$Res>
    implements $AddressDtoCopyWith<$Res> {
  _$AddressDtoCopyWithImpl(this._self, this._then);

  final AddressDto _self;
  final $Res Function(AddressDto) _then;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = freezed,Object? fullAddress = freezed,Object? lat = freezed,Object? lng = freezed,Object? city = freezed,Object? neighborhood = freezed,Object? streetNumber = freezed,Object? buildingNumber = freezed,Object? floor = freezed,Object? apartment = freezed,Object? addressType = freezed,Object? isDefault = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,neighborhood: freezed == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as String?,streetNumber: freezed == streetNumber ? _self.streetNumber : streetNumber // ignore: cast_nullable_to_non_nullable
as String?,buildingNumber: freezed == buildingNumber ? _self.buildingNumber : buildingNumber // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,apartment: freezed == apartment ? _self.apartment : apartment // ignore: cast_nullable_to_non_nullable
as String?,addressType: freezed == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressDto].
extension AddressDtoPatterns on AddressDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressDto value)  $default,){
final _that = this;
switch (_that) {
case _AddressDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressDto value)?  $default,){
final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? label,  String? fullAddress,  double? lat,  double? lng,  String? city,  String? neighborhood,  String? streetNumber,  String? buildingNumber,  String? floor,  String? apartment,  String? addressType, @JsonKey(name: 'default')  bool? isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
return $default(_that.id,_that.label,_that.fullAddress,_that.lat,_that.lng,_that.city,_that.neighborhood,_that.streetNumber,_that.buildingNumber,_that.floor,_that.apartment,_that.addressType,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? label,  String? fullAddress,  double? lat,  double? lng,  String? city,  String? neighborhood,  String? streetNumber,  String? buildingNumber,  String? floor,  String? apartment,  String? addressType, @JsonKey(name: 'default')  bool? isDefault)  $default,) {final _that = this;
switch (_that) {
case _AddressDto():
return $default(_that.id,_that.label,_that.fullAddress,_that.lat,_that.lng,_that.city,_that.neighborhood,_that.streetNumber,_that.buildingNumber,_that.floor,_that.apartment,_that.addressType,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? label,  String? fullAddress,  double? lat,  double? lng,  String? city,  String? neighborhood,  String? streetNumber,  String? buildingNumber,  String? floor,  String? apartment,  String? addressType, @JsonKey(name: 'default')  bool? isDefault)?  $default,) {final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
return $default(_that.id,_that.label,_that.fullAddress,_that.lat,_that.lng,_that.city,_that.neighborhood,_that.streetNumber,_that.buildingNumber,_that.floor,_that.apartment,_that.addressType,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressDto implements AddressDto {
  const _AddressDto({required this.id, this.label, this.fullAddress, this.lat, this.lng, this.city, this.neighborhood, this.streetNumber, this.buildingNumber, this.floor, this.apartment, this.addressType, @JsonKey(name: 'default') this.isDefault});
  factory _AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

@override final  String id;
@override final  String? label;
@override final  String? fullAddress;
@override final  double? lat;
@override final  double? lng;
@override final  String? city;
@override final  String? neighborhood;
@override final  String? streetNumber;
@override final  String? buildingNumber;
@override final  String? floor;
@override final  String? apartment;
@override final  String? addressType;
@override@JsonKey(name: 'default') final  bool? isDefault;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressDtoCopyWith<_AddressDto> get copyWith => __$AddressDtoCopyWithImpl<_AddressDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.city, city) || other.city == city)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.streetNumber, streetNumber) || other.streetNumber == streetNumber)&&(identical(other.buildingNumber, buildingNumber) || other.buildingNumber == buildingNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.apartment, apartment) || other.apartment == apartment)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,fullAddress,lat,lng,city,neighborhood,streetNumber,buildingNumber,floor,apartment,addressType,isDefault);

@override
String toString() {
  return 'AddressDto(id: $id, label: $label, fullAddress: $fullAddress, lat: $lat, lng: $lng, city: $city, neighborhood: $neighborhood, streetNumber: $streetNumber, buildingNumber: $buildingNumber, floor: $floor, apartment: $apartment, addressType: $addressType, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$AddressDtoCopyWith<$Res> implements $AddressDtoCopyWith<$Res> {
  factory _$AddressDtoCopyWith(_AddressDto value, $Res Function(_AddressDto) _then) = __$AddressDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? label, String? fullAddress, double? lat, double? lng, String? city, String? neighborhood, String? streetNumber, String? buildingNumber, String? floor, String? apartment, String? addressType,@JsonKey(name: 'default') bool? isDefault
});




}
/// @nodoc
class __$AddressDtoCopyWithImpl<$Res>
    implements _$AddressDtoCopyWith<$Res> {
  __$AddressDtoCopyWithImpl(this._self, this._then);

  final _AddressDto _self;
  final $Res Function(_AddressDto) _then;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = freezed,Object? fullAddress = freezed,Object? lat = freezed,Object? lng = freezed,Object? city = freezed,Object? neighborhood = freezed,Object? streetNumber = freezed,Object? buildingNumber = freezed,Object? floor = freezed,Object? apartment = freezed,Object? addressType = freezed,Object? isDefault = freezed,}) {
  return _then(_AddressDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,neighborhood: freezed == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as String?,streetNumber: freezed == streetNumber ? _self.streetNumber : streetNumber // ignore: cast_nullable_to_non_nullable
as String?,buildingNumber: freezed == buildingNumber ? _self.buildingNumber : buildingNumber // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,apartment: freezed == apartment ? _self.apartment : apartment // ignore: cast_nullable_to_non_nullable
as String?,addressType: freezed == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
