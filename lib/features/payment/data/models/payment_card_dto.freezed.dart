// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentCardDto {

 String get id; String? get gateway; String? get brand; String? get last4; int? get expMonth; int? get expYear;@JsonKey(name: 'default') bool? get isDefault;
/// Create a copy of PaymentCardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCardDtoCopyWith<PaymentCardDto> get copyWith => _$PaymentCardDtoCopyWithImpl<PaymentCardDto>(this as PaymentCardDto, _$identity);

  /// Serializes this PaymentCardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.expMonth, expMonth) || other.expMonth == expMonth)&&(identical(other.expYear, expYear) || other.expYear == expYear)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,gateway,brand,last4,expMonth,expYear,isDefault);

@override
String toString() {
  return 'PaymentCardDto(id: $id, gateway: $gateway, brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $PaymentCardDtoCopyWith<$Res>  {
  factory $PaymentCardDtoCopyWith(PaymentCardDto value, $Res Function(PaymentCardDto) _then) = _$PaymentCardDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? gateway, String? brand, String? last4, int? expMonth, int? expYear,@JsonKey(name: 'default') bool? isDefault
});




}
/// @nodoc
class _$PaymentCardDtoCopyWithImpl<$Res>
    implements $PaymentCardDtoCopyWith<$Res> {
  _$PaymentCardDtoCopyWithImpl(this._self, this._then);

  final PaymentCardDto _self;
  final $Res Function(PaymentCardDto) _then;

/// Create a copy of PaymentCardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? gateway = freezed,Object? brand = freezed,Object? last4 = freezed,Object? expMonth = freezed,Object? expYear = freezed,Object? isDefault = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,gateway: freezed == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,last4: freezed == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String?,expMonth: freezed == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as int?,expYear: freezed == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as int?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentCardDto].
extension PaymentCardDtoPatterns on PaymentCardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentCardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentCardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentCardDto value)  $default,){
final _that = this;
switch (_that) {
case _PaymentCardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentCardDto value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentCardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? gateway,  String? brand,  String? last4,  int? expMonth,  int? expYear, @JsonKey(name: 'default')  bool? isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentCardDto() when $default != null:
return $default(_that.id,_that.gateway,_that.brand,_that.last4,_that.expMonth,_that.expYear,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? gateway,  String? brand,  String? last4,  int? expMonth,  int? expYear, @JsonKey(name: 'default')  bool? isDefault)  $default,) {final _that = this;
switch (_that) {
case _PaymentCardDto():
return $default(_that.id,_that.gateway,_that.brand,_that.last4,_that.expMonth,_that.expYear,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? gateway,  String? brand,  String? last4,  int? expMonth,  int? expYear, @JsonKey(name: 'default')  bool? isDefault)?  $default,) {final _that = this;
switch (_that) {
case _PaymentCardDto() when $default != null:
return $default(_that.id,_that.gateway,_that.brand,_that.last4,_that.expMonth,_that.expYear,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentCardDto implements PaymentCardDto {
  const _PaymentCardDto({required this.id, this.gateway, this.brand, this.last4, this.expMonth, this.expYear, @JsonKey(name: 'default') this.isDefault});
  factory _PaymentCardDto.fromJson(Map<String, dynamic> json) => _$PaymentCardDtoFromJson(json);

@override final  String id;
@override final  String? gateway;
@override final  String? brand;
@override final  String? last4;
@override final  int? expMonth;
@override final  int? expYear;
@override@JsonKey(name: 'default') final  bool? isDefault;

/// Create a copy of PaymentCardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCardDtoCopyWith<_PaymentCardDto> get copyWith => __$PaymentCardDtoCopyWithImpl<_PaymentCardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentCardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.expMonth, expMonth) || other.expMonth == expMonth)&&(identical(other.expYear, expYear) || other.expYear == expYear)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,gateway,brand,last4,expMonth,expYear,isDefault);

@override
String toString() {
  return 'PaymentCardDto(id: $id, gateway: $gateway, brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$PaymentCardDtoCopyWith<$Res> implements $PaymentCardDtoCopyWith<$Res> {
  factory _$PaymentCardDtoCopyWith(_PaymentCardDto value, $Res Function(_PaymentCardDto) _then) = __$PaymentCardDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? gateway, String? brand, String? last4, int? expMonth, int? expYear,@JsonKey(name: 'default') bool? isDefault
});




}
/// @nodoc
class __$PaymentCardDtoCopyWithImpl<$Res>
    implements _$PaymentCardDtoCopyWith<$Res> {
  __$PaymentCardDtoCopyWithImpl(this._self, this._then);

  final _PaymentCardDto _self;
  final $Res Function(_PaymentCardDto) _then;

/// Create a copy of PaymentCardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? gateway = freezed,Object? brand = freezed,Object? last4 = freezed,Object? expMonth = freezed,Object? expYear = freezed,Object? isDefault = freezed,}) {
  return _then(_PaymentCardDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,gateway: freezed == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,last4: freezed == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String?,expMonth: freezed == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as int?,expYear: freezed == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as int?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
