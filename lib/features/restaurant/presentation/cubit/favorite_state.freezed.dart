// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState()';
}


}

/// @nodoc
class $FavoriteStateCopyWith<$Res>  {
$FavoriteStateCopyWith(FavoriteState _, $Res Function(FavoriteState) __);
}


/// Adds pattern-matching-related methods to [FavoriteState].
extension FavoriteStatePatterns on FavoriteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Set<String> favoriteIds,  List<Restaurant> favoriteRestaurants)?  loaded,TResult Function( Set<String> favoriteIds,  List<Restaurant> favoriteRestaurants,  String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.favoriteIds,_that.favoriteRestaurants);case _Error() when error != null:
return error(_that.favoriteIds,_that.favoriteRestaurants,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Set<String> favoriteIds,  List<Restaurant> favoriteRestaurants)  loaded,required TResult Function( Set<String> favoriteIds,  List<Restaurant> favoriteRestaurants,  String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.favoriteIds,_that.favoriteRestaurants);case _Error():
return error(_that.favoriteIds,_that.favoriteRestaurants,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Set<String> favoriteIds,  List<Restaurant> favoriteRestaurants)?  loaded,TResult? Function( Set<String> favoriteIds,  List<Restaurant> favoriteRestaurants,  String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.favoriteIds,_that.favoriteRestaurants);case _Error() when error != null:
return error(_that.favoriteIds,_that.favoriteRestaurants,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FavoriteState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.initial()';
}


}




/// @nodoc


class _Loading implements FavoriteState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.loading()';
}


}




/// @nodoc


class _Loaded implements FavoriteState {
  const _Loaded({required final  Set<String> favoriteIds, required final  List<Restaurant> favoriteRestaurants}): _favoriteIds = favoriteIds,_favoriteRestaurants = favoriteRestaurants;
  

 final  Set<String> _favoriteIds;
 Set<String> get favoriteIds {
  if (_favoriteIds is EqualUnmodifiableSetView) return _favoriteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favoriteIds);
}

 final  List<Restaurant> _favoriteRestaurants;
 List<Restaurant> get favoriteRestaurants {
  if (_favoriteRestaurants is EqualUnmodifiableListView) return _favoriteRestaurants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteRestaurants);
}


/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._favoriteIds, _favoriteIds)&&const DeepCollectionEquality().equals(other._favoriteRestaurants, _favoriteRestaurants));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favoriteIds),const DeepCollectionEquality().hash(_favoriteRestaurants));

@override
String toString() {
  return 'FavoriteState.loaded(favoriteIds: $favoriteIds, favoriteRestaurants: $favoriteRestaurants)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Set<String> favoriteIds, List<Restaurant> favoriteRestaurants
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? favoriteIds = null,Object? favoriteRestaurants = null,}) {
  return _then(_Loaded(
favoriteIds: null == favoriteIds ? _self._favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as Set<String>,favoriteRestaurants: null == favoriteRestaurants ? _self._favoriteRestaurants : favoriteRestaurants // ignore: cast_nullable_to_non_nullable
as List<Restaurant>,
  ));
}


}

/// @nodoc


class _Error implements FavoriteState {
  const _Error({required final  Set<String> favoriteIds, required final  List<Restaurant> favoriteRestaurants, required this.message}): _favoriteIds = favoriteIds,_favoriteRestaurants = favoriteRestaurants;
  

 final  Set<String> _favoriteIds;
 Set<String> get favoriteIds {
  if (_favoriteIds is EqualUnmodifiableSetView) return _favoriteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favoriteIds);
}

 final  List<Restaurant> _favoriteRestaurants;
 List<Restaurant> get favoriteRestaurants {
  if (_favoriteRestaurants is EqualUnmodifiableListView) return _favoriteRestaurants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteRestaurants);
}

 final  String message;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&const DeepCollectionEquality().equals(other._favoriteIds, _favoriteIds)&&const DeepCollectionEquality().equals(other._favoriteRestaurants, _favoriteRestaurants)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favoriteIds),const DeepCollectionEquality().hash(_favoriteRestaurants),message);

@override
String toString() {
  return 'FavoriteState.error(favoriteIds: $favoriteIds, favoriteRestaurants: $favoriteRestaurants, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Set<String> favoriteIds, List<Restaurant> favoriteRestaurants, String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? favoriteIds = null,Object? favoriteRestaurants = null,Object? message = null,}) {
  return _then(_Error(
favoriteIds: null == favoriteIds ? _self._favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as Set<String>,favoriteRestaurants: null == favoriteRestaurants ? _self._favoriteRestaurants : favoriteRestaurants // ignore: cast_nullable_to_non_nullable
as List<Restaurant>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
