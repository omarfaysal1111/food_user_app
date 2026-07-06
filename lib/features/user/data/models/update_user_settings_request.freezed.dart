// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_user_settings_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateUserSettingsRequest {

 String? get locale; bool? get pushNotifications; bool? get smsNotifications; bool? get emailNotifications; String? get theme;
/// Create a copy of UpdateUserSettingsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserSettingsRequestCopyWith<UpdateUserSettingsRequest> get copyWith => _$UpdateUserSettingsRequestCopyWithImpl<UpdateUserSettingsRequest>(this as UpdateUserSettingsRequest, _$identity);

  /// Serializes this UpdateUserSettingsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserSettingsRequest&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.pushNotifications, pushNotifications) || other.pushNotifications == pushNotifications)&&(identical(other.smsNotifications, smsNotifications) || other.smsNotifications == smsNotifications)&&(identical(other.emailNotifications, emailNotifications) || other.emailNotifications == emailNotifications)&&(identical(other.theme, theme) || other.theme == theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,pushNotifications,smsNotifications,emailNotifications,theme);

@override
String toString() {
  return 'UpdateUserSettingsRequest(locale: $locale, pushNotifications: $pushNotifications, smsNotifications: $smsNotifications, emailNotifications: $emailNotifications, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $UpdateUserSettingsRequestCopyWith<$Res>  {
  factory $UpdateUserSettingsRequestCopyWith(UpdateUserSettingsRequest value, $Res Function(UpdateUserSettingsRequest) _then) = _$UpdateUserSettingsRequestCopyWithImpl;
@useResult
$Res call({
 String? locale, bool? pushNotifications, bool? smsNotifications, bool? emailNotifications, String? theme
});




}
/// @nodoc
class _$UpdateUserSettingsRequestCopyWithImpl<$Res>
    implements $UpdateUserSettingsRequestCopyWith<$Res> {
  _$UpdateUserSettingsRequestCopyWithImpl(this._self, this._then);

  final UpdateUserSettingsRequest _self;
  final $Res Function(UpdateUserSettingsRequest) _then;

/// Create a copy of UpdateUserSettingsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = freezed,Object? pushNotifications = freezed,Object? smsNotifications = freezed,Object? emailNotifications = freezed,Object? theme = freezed,}) {
  return _then(_self.copyWith(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,pushNotifications: freezed == pushNotifications ? _self.pushNotifications : pushNotifications // ignore: cast_nullable_to_non_nullable
as bool?,smsNotifications: freezed == smsNotifications ? _self.smsNotifications : smsNotifications // ignore: cast_nullable_to_non_nullable
as bool?,emailNotifications: freezed == emailNotifications ? _self.emailNotifications : emailNotifications // ignore: cast_nullable_to_non_nullable
as bool?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateUserSettingsRequest].
extension UpdateUserSettingsRequestPatterns on UpdateUserSettingsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateUserSettingsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateUserSettingsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateUserSettingsRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateUserSettingsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateUserSettingsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateUserSettingsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? locale,  bool? pushNotifications,  bool? smsNotifications,  bool? emailNotifications,  String? theme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateUserSettingsRequest() when $default != null:
return $default(_that.locale,_that.pushNotifications,_that.smsNotifications,_that.emailNotifications,_that.theme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? locale,  bool? pushNotifications,  bool? smsNotifications,  bool? emailNotifications,  String? theme)  $default,) {final _that = this;
switch (_that) {
case _UpdateUserSettingsRequest():
return $default(_that.locale,_that.pushNotifications,_that.smsNotifications,_that.emailNotifications,_that.theme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? locale,  bool? pushNotifications,  bool? smsNotifications,  bool? emailNotifications,  String? theme)?  $default,) {final _that = this;
switch (_that) {
case _UpdateUserSettingsRequest() when $default != null:
return $default(_that.locale,_that.pushNotifications,_that.smsNotifications,_that.emailNotifications,_that.theme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateUserSettingsRequest implements UpdateUserSettingsRequest {
  const _UpdateUserSettingsRequest({this.locale, this.pushNotifications, this.smsNotifications, this.emailNotifications, this.theme});
  factory _UpdateUserSettingsRequest.fromJson(Map<String, dynamic> json) => _$UpdateUserSettingsRequestFromJson(json);

@override final  String? locale;
@override final  bool? pushNotifications;
@override final  bool? smsNotifications;
@override final  bool? emailNotifications;
@override final  String? theme;

/// Create a copy of UpdateUserSettingsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserSettingsRequestCopyWith<_UpdateUserSettingsRequest> get copyWith => __$UpdateUserSettingsRequestCopyWithImpl<_UpdateUserSettingsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserSettingsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserSettingsRequest&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.pushNotifications, pushNotifications) || other.pushNotifications == pushNotifications)&&(identical(other.smsNotifications, smsNotifications) || other.smsNotifications == smsNotifications)&&(identical(other.emailNotifications, emailNotifications) || other.emailNotifications == emailNotifications)&&(identical(other.theme, theme) || other.theme == theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,pushNotifications,smsNotifications,emailNotifications,theme);

@override
String toString() {
  return 'UpdateUserSettingsRequest(locale: $locale, pushNotifications: $pushNotifications, smsNotifications: $smsNotifications, emailNotifications: $emailNotifications, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserSettingsRequestCopyWith<$Res> implements $UpdateUserSettingsRequestCopyWith<$Res> {
  factory _$UpdateUserSettingsRequestCopyWith(_UpdateUserSettingsRequest value, $Res Function(_UpdateUserSettingsRequest) _then) = __$UpdateUserSettingsRequestCopyWithImpl;
@override @useResult
$Res call({
 String? locale, bool? pushNotifications, bool? smsNotifications, bool? emailNotifications, String? theme
});




}
/// @nodoc
class __$UpdateUserSettingsRequestCopyWithImpl<$Res>
    implements _$UpdateUserSettingsRequestCopyWith<$Res> {
  __$UpdateUserSettingsRequestCopyWithImpl(this._self, this._then);

  final _UpdateUserSettingsRequest _self;
  final $Res Function(_UpdateUserSettingsRequest) _then;

/// Create a copy of UpdateUserSettingsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = freezed,Object? pushNotifications = freezed,Object? smsNotifications = freezed,Object? emailNotifications = freezed,Object? theme = freezed,}) {
  return _then(_UpdateUserSettingsRequest(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,pushNotifications: freezed == pushNotifications ? _self.pushNotifications : pushNotifications // ignore: cast_nullable_to_non_nullable
as bool?,smsNotifications: freezed == smsNotifications ? _self.smsNotifications : smsNotifications // ignore: cast_nullable_to_non_nullable
as bool?,emailNotifications: freezed == emailNotifications ? _self.emailNotifications : emailNotifications // ignore: cast_nullable_to_non_nullable
as bool?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
