// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketDto {

 String get id; String get userId; String get subject; String get status; String? get assigneeId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TicketDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketDtoCopyWith<TicketDto> get copyWith => _$TicketDtoCopyWithImpl<TicketDto>(this as TicketDto, _$identity);

  /// Serializes this TicketDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.status, status) || other.status == status)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,subject,status,assigneeId,createdAt,updatedAt);

@override
String toString() {
  return 'TicketDto(id: $id, userId: $userId, subject: $subject, status: $status, assigneeId: $assigneeId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TicketDtoCopyWith<$Res>  {
  factory $TicketDtoCopyWith(TicketDto value, $Res Function(TicketDto) _then) = _$TicketDtoCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String subject, String status, String? assigneeId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TicketDtoCopyWithImpl<$Res>
    implements $TicketDtoCopyWith<$Res> {
  _$TicketDtoCopyWithImpl(this._self, this._then);

  final TicketDto _self;
  final $Res Function(TicketDto) _then;

/// Create a copy of TicketDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? subject = null,Object? status = null,Object? assigneeId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,assigneeId: freezed == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketDto].
extension TicketDtoPatterns on TicketDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketDto value)  $default,){
final _that = this;
switch (_that) {
case _TicketDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketDto value)?  $default,){
final _that = this;
switch (_that) {
case _TicketDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String subject,  String status,  String? assigneeId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketDto() when $default != null:
return $default(_that.id,_that.userId,_that.subject,_that.status,_that.assigneeId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String subject,  String status,  String? assigneeId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TicketDto():
return $default(_that.id,_that.userId,_that.subject,_that.status,_that.assigneeId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String subject,  String status,  String? assigneeId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TicketDto() when $default != null:
return $default(_that.id,_that.userId,_that.subject,_that.status,_that.assigneeId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketDto implements TicketDto {
  const _TicketDto({required this.id, required this.userId, required this.subject, required this.status, this.assigneeId, required this.createdAt, required this.updatedAt});
  factory _TicketDto.fromJson(Map<String, dynamic> json) => _$TicketDtoFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String subject;
@override final  String status;
@override final  String? assigneeId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TicketDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketDtoCopyWith<_TicketDto> get copyWith => __$TicketDtoCopyWithImpl<_TicketDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.status, status) || other.status == status)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,subject,status,assigneeId,createdAt,updatedAt);

@override
String toString() {
  return 'TicketDto(id: $id, userId: $userId, subject: $subject, status: $status, assigneeId: $assigneeId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TicketDtoCopyWith<$Res> implements $TicketDtoCopyWith<$Res> {
  factory _$TicketDtoCopyWith(_TicketDto value, $Res Function(_TicketDto) _then) = __$TicketDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String subject, String status, String? assigneeId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TicketDtoCopyWithImpl<$Res>
    implements _$TicketDtoCopyWith<$Res> {
  __$TicketDtoCopyWithImpl(this._self, this._then);

  final _TicketDto _self;
  final $Res Function(_TicketDto) _then;

/// Create a copy of TicketDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? subject = null,Object? status = null,Object? assigneeId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TicketDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,assigneeId: freezed == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
