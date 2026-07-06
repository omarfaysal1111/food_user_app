// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_address_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateAddressRequest {

 String? get label; String? get fullAddress; double? get lat; double? get lng; String? get city; String? get neighborhood; String? get streetNumber; String? get buildingNumber; String? get floor; String? get apartment; String? get addressType;@JsonKey(name: 'default') bool? get isDefault;
/// Create a copy of CreateAddressRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAddressRequestCopyWith<CreateAddressRequest> get copyWith => _$CreateAddressRequestCopyWithImpl<CreateAddressRequest>(this as CreateAddressRequest, _$identity);

  /// Serializes this CreateAddressRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAddressRequest&&(identical(other.label, label) || other.label == label)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.city, city) || other.city == city)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.streetNumber, streetNumber) || other.streetNumber == streetNumber)&&(identical(other.buildingNumber, buildingNumber) || other.buildingNumber == buildingNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.apartment, apartment) || other.apartment == apartment)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,fullAddress,lat,lng,city,neighborhood,streetNumber,buildingNumber,floor,apartment,addressType,isDefault);

@override
String toString() {
  return 'CreateAddressRequest(label: $label, fullAddress: $fullAddress, lat: $lat, lng: $lng, city: $city, neighborhood: $neighborhood, streetNumber: $streetNumber, buildingNumber: $buildingNumber, floor: $floor, apartment: $apartment, addressType: $addressType, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $CreateAddressRequestCopyWith<$Res>  {
  factory $CreateAddressRequestCopyWith(CreateAddressRequest value, $Res Function(CreateAddressRequest) _then) = _$CreateAddressRequestCopyWithImpl;
@useResult
$Res call({
 String? label, String? fullAddress, double? lat, double? lng, String? city, String? neighborhood, String? streetNumber, String? buildingNumber, String? floor, String? apartment, String? addressType,@JsonKey(name: 'default') bool? isDefault
});




}
/// @nodoc
class _$CreateAddressRequestCopyWithImpl<$Res>
    implements $CreateAddressRequestCopyWith<$Res> {
  _$CreateAddressRequestCopyWithImpl(this._self, this._then);

  final CreateAddressRequest _self;
  final $Res Function(CreateAddressRequest) _then;

/// Create a copy of CreateAddressRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = freezed,Object? fullAddress = freezed,Object? lat = freezed,Object? lng = freezed,Object? city = freezed,Object? neighborhood = freezed,Object? streetNumber = freezed,Object? buildingNumber = freezed,Object? floor = freezed,Object? apartment = freezed,Object? addressType = freezed,Object? isDefault = freezed,}) {
  return _then(_self.copyWith(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [CreateAddressRequest].
extension CreateAddressRequestPatterns on CreateAddressRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAddressRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAddressRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAddressRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateAddressRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAddressRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAddressRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? label,  String? fullAddress,  double? lat,  double? lng,  String? city,  String? neighborhood,  String? streetNumber,  String? buildingNumber,  String? floor,  String? apartment,  String? addressType, @JsonKey(name: 'default')  bool? isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAddressRequest() when $default != null:
return $default(_that.label,_that.fullAddress,_that.lat,_that.lng,_that.city,_that.neighborhood,_that.streetNumber,_that.buildingNumber,_that.floor,_that.apartment,_that.addressType,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? label,  String? fullAddress,  double? lat,  double? lng,  String? city,  String? neighborhood,  String? streetNumber,  String? buildingNumber,  String? floor,  String? apartment,  String? addressType, @JsonKey(name: 'default')  bool? isDefault)  $default,) {final _that = this;
switch (_that) {
case _CreateAddressRequest():
return $default(_that.label,_that.fullAddress,_that.lat,_that.lng,_that.city,_that.neighborhood,_that.streetNumber,_that.buildingNumber,_that.floor,_that.apartment,_that.addressType,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? label,  String? fullAddress,  double? lat,  double? lng,  String? city,  String? neighborhood,  String? streetNumber,  String? buildingNumber,  String? floor,  String? apartment,  String? addressType, @JsonKey(name: 'default')  bool? isDefault)?  $default,) {final _that = this;
switch (_that) {
case _CreateAddressRequest() when $default != null:
return $default(_that.label,_that.fullAddress,_that.lat,_that.lng,_that.city,_that.neighborhood,_that.streetNumber,_that.buildingNumber,_that.floor,_that.apartment,_that.addressType,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAddressRequest implements CreateAddressRequest {
  const _CreateAddressRequest({this.label, this.fullAddress, this.lat, this.lng, this.city, this.neighborhood, this.streetNumber, this.buildingNumber, this.floor, this.apartment, this.addressType, @JsonKey(name: 'default') this.isDefault});
  factory _CreateAddressRequest.fromJson(Map<String, dynamic> json) => _$CreateAddressRequestFromJson(json);

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

/// Create a copy of CreateAddressRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAddressRequestCopyWith<_CreateAddressRequest> get copyWith => __$CreateAddressRequestCopyWithImpl<_CreateAddressRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAddressRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAddressRequest&&(identical(other.label, label) || other.label == label)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.city, city) || other.city == city)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.streetNumber, streetNumber) || other.streetNumber == streetNumber)&&(identical(other.buildingNumber, buildingNumber) || other.buildingNumber == buildingNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.apartment, apartment) || other.apartment == apartment)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,fullAddress,lat,lng,city,neighborhood,streetNumber,buildingNumber,floor,apartment,addressType,isDefault);

@override
String toString() {
  return 'CreateAddressRequest(label: $label, fullAddress: $fullAddress, lat: $lat, lng: $lng, city: $city, neighborhood: $neighborhood, streetNumber: $streetNumber, buildingNumber: $buildingNumber, floor: $floor, apartment: $apartment, addressType: $addressType, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$CreateAddressRequestCopyWith<$Res> implements $CreateAddressRequestCopyWith<$Res> {
  factory _$CreateAddressRequestCopyWith(_CreateAddressRequest value, $Res Function(_CreateAddressRequest) _then) = __$CreateAddressRequestCopyWithImpl;
@override @useResult
$Res call({
 String? label, String? fullAddress, double? lat, double? lng, String? city, String? neighborhood, String? streetNumber, String? buildingNumber, String? floor, String? apartment, String? addressType,@JsonKey(name: 'default') bool? isDefault
});




}
/// @nodoc
class __$CreateAddressRequestCopyWithImpl<$Res>
    implements _$CreateAddressRequestCopyWith<$Res> {
  __$CreateAddressRequestCopyWithImpl(this._self, this._then);

  final _CreateAddressRequest _self;
  final $Res Function(_CreateAddressRequest) _then;

/// Create a copy of CreateAddressRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = freezed,Object? fullAddress = freezed,Object? lat = freezed,Object? lng = freezed,Object? city = freezed,Object? neighborhood = freezed,Object? streetNumber = freezed,Object? buildingNumber = freezed,Object? floor = freezed,Object? apartment = freezed,Object? addressType = freezed,Object? isDefault = freezed,}) {
  return _then(_CreateAddressRequest(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
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
