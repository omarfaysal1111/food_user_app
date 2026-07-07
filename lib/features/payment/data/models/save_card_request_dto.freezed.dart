// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_card_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaveCardRequestDto {

 String? get gatewayToken; String? get gateway; String? get brand; String? get last4; int? get expMonth; int? get expYear; bool? get makeDefault;
/// Create a copy of SaveCardRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveCardRequestDtoCopyWith<SaveCardRequestDto> get copyWith => _$SaveCardRequestDtoCopyWithImpl<SaveCardRequestDto>(this as SaveCardRequestDto, _$identity);

  /// Serializes this SaveCardRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveCardRequestDto&&(identical(other.gatewayToken, gatewayToken) || other.gatewayToken == gatewayToken)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.expMonth, expMonth) || other.expMonth == expMonth)&&(identical(other.expYear, expYear) || other.expYear == expYear)&&(identical(other.makeDefault, makeDefault) || other.makeDefault == makeDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gatewayToken,gateway,brand,last4,expMonth,expYear,makeDefault);

@override
String toString() {
  return 'SaveCardRequestDto(gatewayToken: $gatewayToken, gateway: $gateway, brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear, makeDefault: $makeDefault)';
}


}

/// @nodoc
abstract mixin class $SaveCardRequestDtoCopyWith<$Res>  {
  factory $SaveCardRequestDtoCopyWith(SaveCardRequestDto value, $Res Function(SaveCardRequestDto) _then) = _$SaveCardRequestDtoCopyWithImpl;
@useResult
$Res call({
 String? gatewayToken, String? gateway, String? brand, String? last4, int? expMonth, int? expYear, bool? makeDefault
});




}
/// @nodoc
class _$SaveCardRequestDtoCopyWithImpl<$Res>
    implements $SaveCardRequestDtoCopyWith<$Res> {
  _$SaveCardRequestDtoCopyWithImpl(this._self, this._then);

  final SaveCardRequestDto _self;
  final $Res Function(SaveCardRequestDto) _then;

/// Create a copy of SaveCardRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gatewayToken = freezed,Object? gateway = freezed,Object? brand = freezed,Object? last4 = freezed,Object? expMonth = freezed,Object? expYear = freezed,Object? makeDefault = freezed,}) {
  return _then(_self.copyWith(
gatewayToken: freezed == gatewayToken ? _self.gatewayToken : gatewayToken // ignore: cast_nullable_to_non_nullable
as String?,gateway: freezed == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,last4: freezed == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String?,expMonth: freezed == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as int?,expYear: freezed == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as int?,makeDefault: freezed == makeDefault ? _self.makeDefault : makeDefault // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaveCardRequestDto].
extension SaveCardRequestDtoPatterns on SaveCardRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaveCardRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaveCardRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaveCardRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _SaveCardRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaveCardRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _SaveCardRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? gatewayToken,  String? gateway,  String? brand,  String? last4,  int? expMonth,  int? expYear,  bool? makeDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaveCardRequestDto() when $default != null:
return $default(_that.gatewayToken,_that.gateway,_that.brand,_that.last4,_that.expMonth,_that.expYear,_that.makeDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? gatewayToken,  String? gateway,  String? brand,  String? last4,  int? expMonth,  int? expYear,  bool? makeDefault)  $default,) {final _that = this;
switch (_that) {
case _SaveCardRequestDto():
return $default(_that.gatewayToken,_that.gateway,_that.brand,_that.last4,_that.expMonth,_that.expYear,_that.makeDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? gatewayToken,  String? gateway,  String? brand,  String? last4,  int? expMonth,  int? expYear,  bool? makeDefault)?  $default,) {final _that = this;
switch (_that) {
case _SaveCardRequestDto() when $default != null:
return $default(_that.gatewayToken,_that.gateway,_that.brand,_that.last4,_that.expMonth,_that.expYear,_that.makeDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaveCardRequestDto implements SaveCardRequestDto {
  const _SaveCardRequestDto({this.gatewayToken, this.gateway, this.brand, this.last4, this.expMonth, this.expYear, this.makeDefault});
  factory _SaveCardRequestDto.fromJson(Map<String, dynamic> json) => _$SaveCardRequestDtoFromJson(json);

@override final  String? gatewayToken;
@override final  String? gateway;
@override final  String? brand;
@override final  String? last4;
@override final  int? expMonth;
@override final  int? expYear;
@override final  bool? makeDefault;

/// Create a copy of SaveCardRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveCardRequestDtoCopyWith<_SaveCardRequestDto> get copyWith => __$SaveCardRequestDtoCopyWithImpl<_SaveCardRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaveCardRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveCardRequestDto&&(identical(other.gatewayToken, gatewayToken) || other.gatewayToken == gatewayToken)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.expMonth, expMonth) || other.expMonth == expMonth)&&(identical(other.expYear, expYear) || other.expYear == expYear)&&(identical(other.makeDefault, makeDefault) || other.makeDefault == makeDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gatewayToken,gateway,brand,last4,expMonth,expYear,makeDefault);

@override
String toString() {
  return 'SaveCardRequestDto(gatewayToken: $gatewayToken, gateway: $gateway, brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear, makeDefault: $makeDefault)';
}


}

/// @nodoc
abstract mixin class _$SaveCardRequestDtoCopyWith<$Res> implements $SaveCardRequestDtoCopyWith<$Res> {
  factory _$SaveCardRequestDtoCopyWith(_SaveCardRequestDto value, $Res Function(_SaveCardRequestDto) _then) = __$SaveCardRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String? gatewayToken, String? gateway, String? brand, String? last4, int? expMonth, int? expYear, bool? makeDefault
});




}
/// @nodoc
class __$SaveCardRequestDtoCopyWithImpl<$Res>
    implements _$SaveCardRequestDtoCopyWith<$Res> {
  __$SaveCardRequestDtoCopyWithImpl(this._self, this._then);

  final _SaveCardRequestDto _self;
  final $Res Function(_SaveCardRequestDto) _then;

/// Create a copy of SaveCardRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gatewayToken = freezed,Object? gateway = freezed,Object? brand = freezed,Object? last4 = freezed,Object? expMonth = freezed,Object? expYear = freezed,Object? makeDefault = freezed,}) {
  return _then(_SaveCardRequestDto(
gatewayToken: freezed == gatewayToken ? _self.gatewayToken : gatewayToken // ignore: cast_nullable_to_non_nullable
as String?,gateway: freezed == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,last4: freezed == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String?,expMonth: freezed == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as int?,expYear: freezed == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as int?,makeDefault: freezed == makeDefault ? _self.makeDefault : makeDefault // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
