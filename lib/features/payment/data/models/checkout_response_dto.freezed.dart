// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutResponseDto {

 String? get transactionId; String? get paymentIntentId; String? get clientSecret; double? get amount; String? get currency;
/// Create a copy of CheckoutResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutResponseDtoCopyWith<CheckoutResponseDto> get copyWith => _$CheckoutResponseDtoCopyWithImpl<CheckoutResponseDto>(this as CheckoutResponseDto, _$identity);

  /// Serializes this CheckoutResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutResponseDto&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.paymentIntentId, paymentIntentId) || other.paymentIntentId == paymentIntentId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,paymentIntentId,clientSecret,amount,currency);

@override
String toString() {
  return 'CheckoutResponseDto(transactionId: $transactionId, paymentIntentId: $paymentIntentId, clientSecret: $clientSecret, amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $CheckoutResponseDtoCopyWith<$Res>  {
  factory $CheckoutResponseDtoCopyWith(CheckoutResponseDto value, $Res Function(CheckoutResponseDto) _then) = _$CheckoutResponseDtoCopyWithImpl;
@useResult
$Res call({
 String? transactionId, String? paymentIntentId, String? clientSecret, double? amount, String? currency
});




}
/// @nodoc
class _$CheckoutResponseDtoCopyWithImpl<$Res>
    implements $CheckoutResponseDtoCopyWith<$Res> {
  _$CheckoutResponseDtoCopyWithImpl(this._self, this._then);

  final CheckoutResponseDto _self;
  final $Res Function(CheckoutResponseDto) _then;

/// Create a copy of CheckoutResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = freezed,Object? paymentIntentId = freezed,Object? clientSecret = freezed,Object? amount = freezed,Object? currency = freezed,}) {
  return _then(_self.copyWith(
transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,paymentIntentId: freezed == paymentIntentId ? _self.paymentIntentId : paymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,clientSecret: freezed == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutResponseDto].
extension CheckoutResponseDtoPatterns on CheckoutResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? transactionId,  String? paymentIntentId,  String? clientSecret,  double? amount,  String? currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutResponseDto() when $default != null:
return $default(_that.transactionId,_that.paymentIntentId,_that.clientSecret,_that.amount,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? transactionId,  String? paymentIntentId,  String? clientSecret,  double? amount,  String? currency)  $default,) {final _that = this;
switch (_that) {
case _CheckoutResponseDto():
return $default(_that.transactionId,_that.paymentIntentId,_that.clientSecret,_that.amount,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? transactionId,  String? paymentIntentId,  String? clientSecret,  double? amount,  String? currency)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutResponseDto() when $default != null:
return $default(_that.transactionId,_that.paymentIntentId,_that.clientSecret,_that.amount,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutResponseDto implements CheckoutResponseDto {
  const _CheckoutResponseDto({this.transactionId, this.paymentIntentId, this.clientSecret, this.amount, this.currency});
  factory _CheckoutResponseDto.fromJson(Map<String, dynamic> json) => _$CheckoutResponseDtoFromJson(json);

@override final  String? transactionId;
@override final  String? paymentIntentId;
@override final  String? clientSecret;
@override final  double? amount;
@override final  String? currency;

/// Create a copy of CheckoutResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutResponseDtoCopyWith<_CheckoutResponseDto> get copyWith => __$CheckoutResponseDtoCopyWithImpl<_CheckoutResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutResponseDto&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.paymentIntentId, paymentIntentId) || other.paymentIntentId == paymentIntentId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,paymentIntentId,clientSecret,amount,currency);

@override
String toString() {
  return 'CheckoutResponseDto(transactionId: $transactionId, paymentIntentId: $paymentIntentId, clientSecret: $clientSecret, amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$CheckoutResponseDtoCopyWith<$Res> implements $CheckoutResponseDtoCopyWith<$Res> {
  factory _$CheckoutResponseDtoCopyWith(_CheckoutResponseDto value, $Res Function(_CheckoutResponseDto) _then) = __$CheckoutResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String? transactionId, String? paymentIntentId, String? clientSecret, double? amount, String? currency
});




}
/// @nodoc
class __$CheckoutResponseDtoCopyWithImpl<$Res>
    implements _$CheckoutResponseDtoCopyWith<$Res> {
  __$CheckoutResponseDtoCopyWithImpl(this._self, this._then);

  final _CheckoutResponseDto _self;
  final $Res Function(_CheckoutResponseDto) _then;

/// Create a copy of CheckoutResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = freezed,Object? paymentIntentId = freezed,Object? clientSecret = freezed,Object? amount = freezed,Object? currency = freezed,}) {
  return _then(_CheckoutResponseDto(
transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,paymentIntentId: freezed == paymentIntentId ? _self.paymentIntentId : paymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,clientSecret: freezed == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
