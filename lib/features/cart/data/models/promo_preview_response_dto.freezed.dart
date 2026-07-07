// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_preview_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromoPreviewResponseDto {

 double get discountAmount; double get total;
/// Create a copy of PromoPreviewResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromoPreviewResponseDtoCopyWith<PromoPreviewResponseDto> get copyWith => _$PromoPreviewResponseDtoCopyWithImpl<PromoPreviewResponseDto>(this as PromoPreviewResponseDto, _$identity);

  /// Serializes this PromoPreviewResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromoPreviewResponseDto&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,discountAmount,total);

@override
String toString() {
  return 'PromoPreviewResponseDto(discountAmount: $discountAmount, total: $total)';
}


}

/// @nodoc
abstract mixin class $PromoPreviewResponseDtoCopyWith<$Res>  {
  factory $PromoPreviewResponseDtoCopyWith(PromoPreviewResponseDto value, $Res Function(PromoPreviewResponseDto) _then) = _$PromoPreviewResponseDtoCopyWithImpl;
@useResult
$Res call({
 double discountAmount, double total
});




}
/// @nodoc
class _$PromoPreviewResponseDtoCopyWithImpl<$Res>
    implements $PromoPreviewResponseDtoCopyWith<$Res> {
  _$PromoPreviewResponseDtoCopyWithImpl(this._self, this._then);

  final PromoPreviewResponseDto _self;
  final $Res Function(PromoPreviewResponseDto) _then;

/// Create a copy of PromoPreviewResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? discountAmount = null,Object? total = null,}) {
  return _then(_self.copyWith(
discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PromoPreviewResponseDto].
extension PromoPreviewResponseDtoPatterns on PromoPreviewResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromoPreviewResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromoPreviewResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromoPreviewResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _PromoPreviewResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromoPreviewResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _PromoPreviewResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double discountAmount,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromoPreviewResponseDto() when $default != null:
return $default(_that.discountAmount,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double discountAmount,  double total)  $default,) {final _that = this;
switch (_that) {
case _PromoPreviewResponseDto():
return $default(_that.discountAmount,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double discountAmount,  double total)?  $default,) {final _that = this;
switch (_that) {
case _PromoPreviewResponseDto() when $default != null:
return $default(_that.discountAmount,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromoPreviewResponseDto implements PromoPreviewResponseDto {
  const _PromoPreviewResponseDto({required this.discountAmount, required this.total});
  factory _PromoPreviewResponseDto.fromJson(Map<String, dynamic> json) => _$PromoPreviewResponseDtoFromJson(json);

@override final  double discountAmount;
@override final  double total;

/// Create a copy of PromoPreviewResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoPreviewResponseDtoCopyWith<_PromoPreviewResponseDto> get copyWith => __$PromoPreviewResponseDtoCopyWithImpl<_PromoPreviewResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromoPreviewResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoPreviewResponseDto&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,discountAmount,total);

@override
String toString() {
  return 'PromoPreviewResponseDto(discountAmount: $discountAmount, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PromoPreviewResponseDtoCopyWith<$Res> implements $PromoPreviewResponseDtoCopyWith<$Res> {
  factory _$PromoPreviewResponseDtoCopyWith(_PromoPreviewResponseDto value, $Res Function(_PromoPreviewResponseDto) _then) = __$PromoPreviewResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 double discountAmount, double total
});




}
/// @nodoc
class __$PromoPreviewResponseDtoCopyWithImpl<$Res>
    implements _$PromoPreviewResponseDtoCopyWith<$Res> {
  __$PromoPreviewResponseDtoCopyWithImpl(this._self, this._then);

  final _PromoPreviewResponseDto _self;
  final $Res Function(_PromoPreviewResponseDto) _then;

/// Create a copy of PromoPreviewResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? discountAmount = null,Object? total = null,}) {
  return _then(_PromoPreviewResponseDto(
discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
