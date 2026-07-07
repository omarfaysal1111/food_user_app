// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutRequestDto {

 String get orderId; String? get paymentMethodType;
/// Create a copy of CheckoutRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutRequestDtoCopyWith<CheckoutRequestDto> get copyWith => _$CheckoutRequestDtoCopyWithImpl<CheckoutRequestDto>(this as CheckoutRequestDto, _$identity);

  /// Serializes this CheckoutRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutRequestDto&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentMethodType, paymentMethodType) || other.paymentMethodType == paymentMethodType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,paymentMethodType);

@override
String toString() {
  return 'CheckoutRequestDto(orderId: $orderId, paymentMethodType: $paymentMethodType)';
}


}

/// @nodoc
abstract mixin class $CheckoutRequestDtoCopyWith<$Res>  {
  factory $CheckoutRequestDtoCopyWith(CheckoutRequestDto value, $Res Function(CheckoutRequestDto) _then) = _$CheckoutRequestDtoCopyWithImpl;
@useResult
$Res call({
 String orderId, String? paymentMethodType
});




}
/// @nodoc
class _$CheckoutRequestDtoCopyWithImpl<$Res>
    implements $CheckoutRequestDtoCopyWith<$Res> {
  _$CheckoutRequestDtoCopyWithImpl(this._self, this._then);

  final CheckoutRequestDto _self;
  final $Res Function(CheckoutRequestDto) _then;

/// Create a copy of CheckoutRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? paymentMethodType = freezed,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paymentMethodType: freezed == paymentMethodType ? _self.paymentMethodType : paymentMethodType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutRequestDto].
extension CheckoutRequestDtoPatterns on CheckoutRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String? paymentMethodType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutRequestDto() when $default != null:
return $default(_that.orderId,_that.paymentMethodType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String? paymentMethodType)  $default,) {final _that = this;
switch (_that) {
case _CheckoutRequestDto():
return $default(_that.orderId,_that.paymentMethodType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String? paymentMethodType)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutRequestDto() when $default != null:
return $default(_that.orderId,_that.paymentMethodType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutRequestDto implements CheckoutRequestDto {
  const _CheckoutRequestDto({required this.orderId, this.paymentMethodType});
  factory _CheckoutRequestDto.fromJson(Map<String, dynamic> json) => _$CheckoutRequestDtoFromJson(json);

@override final  String orderId;
@override final  String? paymentMethodType;

/// Create a copy of CheckoutRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutRequestDtoCopyWith<_CheckoutRequestDto> get copyWith => __$CheckoutRequestDtoCopyWithImpl<_CheckoutRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutRequestDto&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentMethodType, paymentMethodType) || other.paymentMethodType == paymentMethodType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,paymentMethodType);

@override
String toString() {
  return 'CheckoutRequestDto(orderId: $orderId, paymentMethodType: $paymentMethodType)';
}


}

/// @nodoc
abstract mixin class _$CheckoutRequestDtoCopyWith<$Res> implements $CheckoutRequestDtoCopyWith<$Res> {
  factory _$CheckoutRequestDtoCopyWith(_CheckoutRequestDto value, $Res Function(_CheckoutRequestDto) _then) = __$CheckoutRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String? paymentMethodType
});




}
/// @nodoc
class __$CheckoutRequestDtoCopyWithImpl<$Res>
    implements _$CheckoutRequestDtoCopyWith<$Res> {
  __$CheckoutRequestDtoCopyWithImpl(this._self, this._then);

  final _CheckoutRequestDto _self;
  final $Res Function(_CheckoutRequestDto) _then;

/// Create a copy of CheckoutRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? paymentMethodType = freezed,}) {
  return _then(_CheckoutRequestDto(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paymentMethodType: freezed == paymentMethodType ? _self.paymentMethodType : paymentMethodType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
