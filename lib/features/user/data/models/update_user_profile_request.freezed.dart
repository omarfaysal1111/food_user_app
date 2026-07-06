// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_user_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateUserProfileRequest {

 String? get firstName; String? get lastName; String? get phone; String? get email; String? get avatar; String? get locale;
/// Create a copy of UpdateUserProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserProfileRequestCopyWith<UpdateUserProfileRequest> get copyWith => _$UpdateUserProfileRequestCopyWithImpl<UpdateUserProfileRequest>(this as UpdateUserProfileRequest, _$identity);

  /// Serializes this UpdateUserProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserProfileRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.locale, locale) || other.locale == locale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phone,email,avatar,locale);

@override
String toString() {
  return 'UpdateUserProfileRequest(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, avatar: $avatar, locale: $locale)';
}


}

/// @nodoc
abstract mixin class $UpdateUserProfileRequestCopyWith<$Res>  {
  factory $UpdateUserProfileRequestCopyWith(UpdateUserProfileRequest value, $Res Function(UpdateUserProfileRequest) _then) = _$UpdateUserProfileRequestCopyWithImpl;
@useResult
$Res call({
 String? firstName, String? lastName, String? phone, String? email, String? avatar, String? locale
});




}
/// @nodoc
class _$UpdateUserProfileRequestCopyWithImpl<$Res>
    implements $UpdateUserProfileRequestCopyWith<$Res> {
  _$UpdateUserProfileRequestCopyWithImpl(this._self, this._then);

  final UpdateUserProfileRequest _self;
  final $Res Function(UpdateUserProfileRequest) _then;

/// Create a copy of UpdateUserProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? phone = freezed,Object? email = freezed,Object? avatar = freezed,Object? locale = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateUserProfileRequest].
extension UpdateUserProfileRequestPatterns on UpdateUserProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateUserProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateUserProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateUserProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateUserProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateUserProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateUserProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? firstName,  String? lastName,  String? phone,  String? email,  String? avatar,  String? locale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateUserProfileRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.email,_that.avatar,_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? firstName,  String? lastName,  String? phone,  String? email,  String? avatar,  String? locale)  $default,) {final _that = this;
switch (_that) {
case _UpdateUserProfileRequest():
return $default(_that.firstName,_that.lastName,_that.phone,_that.email,_that.avatar,_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? firstName,  String? lastName,  String? phone,  String? email,  String? avatar,  String? locale)?  $default,) {final _that = this;
switch (_that) {
case _UpdateUserProfileRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.email,_that.avatar,_that.locale);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateUserProfileRequest implements UpdateUserProfileRequest {
  const _UpdateUserProfileRequest({this.firstName, this.lastName, this.phone, this.email, this.avatar, this.locale});
  factory _UpdateUserProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateUserProfileRequestFromJson(json);

@override final  String? firstName;
@override final  String? lastName;
@override final  String? phone;
@override final  String? email;
@override final  String? avatar;
@override final  String? locale;

/// Create a copy of UpdateUserProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserProfileRequestCopyWith<_UpdateUserProfileRequest> get copyWith => __$UpdateUserProfileRequestCopyWithImpl<_UpdateUserProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserProfileRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.locale, locale) || other.locale == locale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phone,email,avatar,locale);

@override
String toString() {
  return 'UpdateUserProfileRequest(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, avatar: $avatar, locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserProfileRequestCopyWith<$Res> implements $UpdateUserProfileRequestCopyWith<$Res> {
  factory _$UpdateUserProfileRequestCopyWith(_UpdateUserProfileRequest value, $Res Function(_UpdateUserProfileRequest) _then) = __$UpdateUserProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String? firstName, String? lastName, String? phone, String? email, String? avatar, String? locale
});




}
/// @nodoc
class __$UpdateUserProfileRequestCopyWithImpl<$Res>
    implements _$UpdateUserProfileRequestCopyWith<$Res> {
  __$UpdateUserProfileRequestCopyWithImpl(this._self, this._then);

  final _UpdateUserProfileRequest _self;
  final $Res Function(_UpdateUserProfileRequest) _then;

/// Create a copy of UpdateUserProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? phone = freezed,Object? email = freezed,Object? avatar = freezed,Object? locale = freezed,}) {
  return _then(_UpdateUserProfileRequest(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
