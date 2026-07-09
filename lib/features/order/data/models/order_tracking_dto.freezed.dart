// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_tracking_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderTrackingDto {

 String get orderId; String get status; int? get estimatedMinutes; String? get driverName; String? get driverPhone; double? get driverLat; double? get driverLng; double? get driverRating; List<TimelineEntryDto>? get timeline;
/// Create a copy of OrderTrackingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderTrackingDtoCopyWith<OrderTrackingDto> get copyWith => _$OrderTrackingDtoCopyWithImpl<OrderTrackingDto>(this as OrderTrackingDto, _$identity);

  /// Serializes this OrderTrackingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderTrackingDto&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.driverLat, driverLat) || other.driverLat == driverLat)&&(identical(other.driverLng, driverLng) || other.driverLng == driverLng)&&(identical(other.driverRating, driverRating) || other.driverRating == driverRating)&&const DeepCollectionEquality().equals(other.timeline, timeline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,status,estimatedMinutes,driverName,driverPhone,driverLat,driverLng,driverRating,const DeepCollectionEquality().hash(timeline));

@override
String toString() {
  return 'OrderTrackingDto(orderId: $orderId, status: $status, estimatedMinutes: $estimatedMinutes, driverName: $driverName, driverPhone: $driverPhone, driverLat: $driverLat, driverLng: $driverLng, driverRating: $driverRating, timeline: $timeline)';
}


}

/// @nodoc
abstract mixin class $OrderTrackingDtoCopyWith<$Res>  {
  factory $OrderTrackingDtoCopyWith(OrderTrackingDto value, $Res Function(OrderTrackingDto) _then) = _$OrderTrackingDtoCopyWithImpl;
@useResult
$Res call({
 String orderId, String status, int? estimatedMinutes, String? driverName, String? driverPhone, double? driverLat, double? driverLng, double? driverRating, List<TimelineEntryDto>? timeline
});




}
/// @nodoc
class _$OrderTrackingDtoCopyWithImpl<$Res>
    implements $OrderTrackingDtoCopyWith<$Res> {
  _$OrderTrackingDtoCopyWithImpl(this._self, this._then);

  final OrderTrackingDto _self;
  final $Res Function(OrderTrackingDto) _then;

/// Create a copy of OrderTrackingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? status = null,Object? estimatedMinutes = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? driverLat = freezed,Object? driverLng = freezed,Object? driverRating = freezed,Object? timeline = freezed,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: freezed == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,driverLat: freezed == driverLat ? _self.driverLat : driverLat // ignore: cast_nullable_to_non_nullable
as double?,driverLng: freezed == driverLng ? _self.driverLng : driverLng // ignore: cast_nullable_to_non_nullable
as double?,driverRating: freezed == driverRating ? _self.driverRating : driverRating // ignore: cast_nullable_to_non_nullable
as double?,timeline: freezed == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelineEntryDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderTrackingDto].
extension OrderTrackingDtoPatterns on OrderTrackingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderTrackingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderTrackingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderTrackingDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderTrackingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderTrackingDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderTrackingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String status,  int? estimatedMinutes,  String? driverName,  String? driverPhone,  double? driverLat,  double? driverLng,  double? driverRating,  List<TimelineEntryDto>? timeline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderTrackingDto() when $default != null:
return $default(_that.orderId,_that.status,_that.estimatedMinutes,_that.driverName,_that.driverPhone,_that.driverLat,_that.driverLng,_that.driverRating,_that.timeline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String status,  int? estimatedMinutes,  String? driverName,  String? driverPhone,  double? driverLat,  double? driverLng,  double? driverRating,  List<TimelineEntryDto>? timeline)  $default,) {final _that = this;
switch (_that) {
case _OrderTrackingDto():
return $default(_that.orderId,_that.status,_that.estimatedMinutes,_that.driverName,_that.driverPhone,_that.driverLat,_that.driverLng,_that.driverRating,_that.timeline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String status,  int? estimatedMinutes,  String? driverName,  String? driverPhone,  double? driverLat,  double? driverLng,  double? driverRating,  List<TimelineEntryDto>? timeline)?  $default,) {final _that = this;
switch (_that) {
case _OrderTrackingDto() when $default != null:
return $default(_that.orderId,_that.status,_that.estimatedMinutes,_that.driverName,_that.driverPhone,_that.driverLat,_that.driverLng,_that.driverRating,_that.timeline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderTrackingDto implements OrderTrackingDto {
  const _OrderTrackingDto({required this.orderId, required this.status, this.estimatedMinutes, this.driverName, this.driverPhone, this.driverLat, this.driverLng, this.driverRating, final  List<TimelineEntryDto>? timeline}): _timeline = timeline;
  factory _OrderTrackingDto.fromJson(Map<String, dynamic> json) => _$OrderTrackingDtoFromJson(json);

@override final  String orderId;
@override final  String status;
@override final  int? estimatedMinutes;
@override final  String? driverName;
@override final  String? driverPhone;
@override final  double? driverLat;
@override final  double? driverLng;
@override final  double? driverRating;
 final  List<TimelineEntryDto>? _timeline;
@override List<TimelineEntryDto>? get timeline {
  final value = _timeline;
  if (value == null) return null;
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OrderTrackingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderTrackingDtoCopyWith<_OrderTrackingDto> get copyWith => __$OrderTrackingDtoCopyWithImpl<_OrderTrackingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderTrackingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderTrackingDto&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.driverLat, driverLat) || other.driverLat == driverLat)&&(identical(other.driverLng, driverLng) || other.driverLng == driverLng)&&(identical(other.driverRating, driverRating) || other.driverRating == driverRating)&&const DeepCollectionEquality().equals(other._timeline, _timeline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,status,estimatedMinutes,driverName,driverPhone,driverLat,driverLng,driverRating,const DeepCollectionEquality().hash(_timeline));

@override
String toString() {
  return 'OrderTrackingDto(orderId: $orderId, status: $status, estimatedMinutes: $estimatedMinutes, driverName: $driverName, driverPhone: $driverPhone, driverLat: $driverLat, driverLng: $driverLng, driverRating: $driverRating, timeline: $timeline)';
}


}

/// @nodoc
abstract mixin class _$OrderTrackingDtoCopyWith<$Res> implements $OrderTrackingDtoCopyWith<$Res> {
  factory _$OrderTrackingDtoCopyWith(_OrderTrackingDto value, $Res Function(_OrderTrackingDto) _then) = __$OrderTrackingDtoCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String status, int? estimatedMinutes, String? driverName, String? driverPhone, double? driverLat, double? driverLng, double? driverRating, List<TimelineEntryDto>? timeline
});




}
/// @nodoc
class __$OrderTrackingDtoCopyWithImpl<$Res>
    implements _$OrderTrackingDtoCopyWith<$Res> {
  __$OrderTrackingDtoCopyWithImpl(this._self, this._then);

  final _OrderTrackingDto _self;
  final $Res Function(_OrderTrackingDto) _then;

/// Create a copy of OrderTrackingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? status = null,Object? estimatedMinutes = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? driverLat = freezed,Object? driverLng = freezed,Object? driverRating = freezed,Object? timeline = freezed,}) {
  return _then(_OrderTrackingDto(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: freezed == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,driverLat: freezed == driverLat ? _self.driverLat : driverLat // ignore: cast_nullable_to_non_nullable
as double?,driverLng: freezed == driverLng ? _self.driverLng : driverLng // ignore: cast_nullable_to_non_nullable
as double?,driverRating: freezed == driverRating ? _self.driverRating : driverRating // ignore: cast_nullable_to_non_nullable
as double?,timeline: freezed == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelineEntryDto>?,
  ));
}


}


/// @nodoc
mixin _$TimelineEntryDto {

 String get status; String? get description; DateTime get timestamp;
/// Create a copy of TimelineEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineEntryDtoCopyWith<TimelineEntryDto> get copyWith => _$TimelineEntryDtoCopyWithImpl<TimelineEntryDto>(this as TimelineEntryDto, _$identity);

  /// Serializes this TimelineEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineEntryDto&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,description,timestamp);

@override
String toString() {
  return 'TimelineEntryDto(status: $status, description: $description, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $TimelineEntryDtoCopyWith<$Res>  {
  factory $TimelineEntryDtoCopyWith(TimelineEntryDto value, $Res Function(TimelineEntryDto) _then) = _$TimelineEntryDtoCopyWithImpl;
@useResult
$Res call({
 String status, String? description, DateTime timestamp
});




}
/// @nodoc
class _$TimelineEntryDtoCopyWithImpl<$Res>
    implements $TimelineEntryDtoCopyWith<$Res> {
  _$TimelineEntryDtoCopyWithImpl(this._self, this._then);

  final TimelineEntryDto _self;
  final $Res Function(TimelineEntryDto) _then;

/// Create a copy of TimelineEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? description = freezed,Object? timestamp = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelineEntryDto].
extension TimelineEntryDtoPatterns on TimelineEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelineEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelineEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelineEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _TimelineEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelineEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimelineEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String? description,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelineEntryDto() when $default != null:
return $default(_that.status,_that.description,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String? description,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _TimelineEntryDto():
return $default(_that.status,_that.description,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String? description,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _TimelineEntryDto() when $default != null:
return $default(_that.status,_that.description,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelineEntryDto implements TimelineEntryDto {
  const _TimelineEntryDto({required this.status, this.description, required this.timestamp});
  factory _TimelineEntryDto.fromJson(Map<String, dynamic> json) => _$TimelineEntryDtoFromJson(json);

@override final  String status;
@override final  String? description;
@override final  DateTime timestamp;

/// Create a copy of TimelineEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineEntryDtoCopyWith<_TimelineEntryDto> get copyWith => __$TimelineEntryDtoCopyWithImpl<_TimelineEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineEntryDto&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,description,timestamp);

@override
String toString() {
  return 'TimelineEntryDto(status: $status, description: $description, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$TimelineEntryDtoCopyWith<$Res> implements $TimelineEntryDtoCopyWith<$Res> {
  factory _$TimelineEntryDtoCopyWith(_TimelineEntryDto value, $Res Function(_TimelineEntryDto) _then) = __$TimelineEntryDtoCopyWithImpl;
@override @useResult
$Res call({
 String status, String? description, DateTime timestamp
});




}
/// @nodoc
class __$TimelineEntryDtoCopyWithImpl<$Res>
    implements _$TimelineEntryDtoCopyWith<$Res> {
  __$TimelineEntryDtoCopyWithImpl(this._self, this._then);

  final _TimelineEntryDto _self;
  final $Res Function(_TimelineEntryDto) _then;

/// Create a copy of TimelineEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? description = freezed,Object? timestamp = null,}) {
  return _then(_TimelineEntryDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
