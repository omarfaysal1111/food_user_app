// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupportMessageDto {

 String get id; String get senderId; String get senderRole; String get content; DateTime get sentAt;
/// Create a copy of SupportMessageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportMessageDtoCopyWith<SupportMessageDto> get copyWith => _$SupportMessageDtoCopyWithImpl<SupportMessageDto>(this as SupportMessageDto, _$identity);

  /// Serializes this SupportMessageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportMessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderRole, senderRole) || other.senderRole == senderRole)&&(identical(other.content, content) || other.content == content)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,senderRole,content,sentAt);

@override
String toString() {
  return 'SupportMessageDto(id: $id, senderId: $senderId, senderRole: $senderRole, content: $content, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class $SupportMessageDtoCopyWith<$Res>  {
  factory $SupportMessageDtoCopyWith(SupportMessageDto value, $Res Function(SupportMessageDto) _then) = _$SupportMessageDtoCopyWithImpl;
@useResult
$Res call({
 String id, String senderId, String senderRole, String content, DateTime sentAt
});




}
/// @nodoc
class _$SupportMessageDtoCopyWithImpl<$Res>
    implements $SupportMessageDtoCopyWith<$Res> {
  _$SupportMessageDtoCopyWithImpl(this._self, this._then);

  final SupportMessageDto _self;
  final $Res Function(SupportMessageDto) _then;

/// Create a copy of SupportMessageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? senderId = null,Object? senderRole = null,Object? content = null,Object? sentAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderRole: null == senderRole ? _self.senderRole : senderRole // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportMessageDto].
extension SupportMessageDtoPatterns on SupportMessageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportMessageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportMessageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportMessageDto value)  $default,){
final _that = this;
switch (_that) {
case _SupportMessageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportMessageDto value)?  $default,){
final _that = this;
switch (_that) {
case _SupportMessageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String senderId,  String senderRole,  String content,  DateTime sentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportMessageDto() when $default != null:
return $default(_that.id,_that.senderId,_that.senderRole,_that.content,_that.sentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String senderId,  String senderRole,  String content,  DateTime sentAt)  $default,) {final _that = this;
switch (_that) {
case _SupportMessageDto():
return $default(_that.id,_that.senderId,_that.senderRole,_that.content,_that.sentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String senderId,  String senderRole,  String content,  DateTime sentAt)?  $default,) {final _that = this;
switch (_that) {
case _SupportMessageDto() when $default != null:
return $default(_that.id,_that.senderId,_that.senderRole,_that.content,_that.sentAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportMessageDto implements SupportMessageDto {
  const _SupportMessageDto({required this.id, required this.senderId, required this.senderRole, required this.content, required this.sentAt});
  factory _SupportMessageDto.fromJson(Map<String, dynamic> json) => _$SupportMessageDtoFromJson(json);

@override final  String id;
@override final  String senderId;
@override final  String senderRole;
@override final  String content;
@override final  DateTime sentAt;

/// Create a copy of SupportMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportMessageDtoCopyWith<_SupportMessageDto> get copyWith => __$SupportMessageDtoCopyWithImpl<_SupportMessageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportMessageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportMessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderRole, senderRole) || other.senderRole == senderRole)&&(identical(other.content, content) || other.content == content)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,senderRole,content,sentAt);

@override
String toString() {
  return 'SupportMessageDto(id: $id, senderId: $senderId, senderRole: $senderRole, content: $content, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class _$SupportMessageDtoCopyWith<$Res> implements $SupportMessageDtoCopyWith<$Res> {
  factory _$SupportMessageDtoCopyWith(_SupportMessageDto value, $Res Function(_SupportMessageDto) _then) = __$SupportMessageDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String senderId, String senderRole, String content, DateTime sentAt
});




}
/// @nodoc
class __$SupportMessageDtoCopyWithImpl<$Res>
    implements _$SupportMessageDtoCopyWith<$Res> {
  __$SupportMessageDtoCopyWithImpl(this._self, this._then);

  final _SupportMessageDto _self;
  final $Res Function(_SupportMessageDto) _then;

/// Create a copy of SupportMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderId = null,Object? senderRole = null,Object? content = null,Object? sentAt = null,}) {
  return _then(_SupportMessageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderRole: null == senderRole ? _self.senderRole : senderRole // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
