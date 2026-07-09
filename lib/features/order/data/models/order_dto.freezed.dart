// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDto {

 String get id; String get customerId; String get branchId; String get status; double get subtotal; double get deliveryFee; double get total; double get discount; List<OrderItemDto> get items; DateTime get createdAt; String? get restaurantName; String? get deliveryAddress; double? get deliveryLat; double? get deliveryLng; String? get paymentMethod; int? get estimatedMinutes; String? get driverName; String? get driverPhone; double? get driverLat; double? get driverLng;
/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDtoCopyWith<OrderDto> get copyWith => _$OrderDtoCopyWithImpl<OrderDto>(this as OrderDto, _$identity);

  /// Serializes this OrderDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.discount, discount) || other.discount == discount)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.deliveryLat, deliveryLat) || other.deliveryLat == deliveryLat)&&(identical(other.deliveryLng, deliveryLng) || other.deliveryLng == deliveryLng)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.driverLat, driverLat) || other.driverLat == driverLat)&&(identical(other.driverLng, driverLng) || other.driverLng == driverLng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,branchId,status,subtotal,deliveryFee,total,discount,const DeepCollectionEquality().hash(items),createdAt,restaurantName,deliveryAddress,deliveryLat,deliveryLng,paymentMethod,estimatedMinutes,driverName,driverPhone,driverLat,driverLng]);

@override
String toString() {
  return 'OrderDto(id: $id, customerId: $customerId, branchId: $branchId, status: $status, subtotal: $subtotal, deliveryFee: $deliveryFee, total: $total, discount: $discount, items: $items, createdAt: $createdAt, restaurantName: $restaurantName, deliveryAddress: $deliveryAddress, deliveryLat: $deliveryLat, deliveryLng: $deliveryLng, paymentMethod: $paymentMethod, estimatedMinutes: $estimatedMinutes, driverName: $driverName, driverPhone: $driverPhone, driverLat: $driverLat, driverLng: $driverLng)';
}


}

/// @nodoc
abstract mixin class $OrderDtoCopyWith<$Res>  {
  factory $OrderDtoCopyWith(OrderDto value, $Res Function(OrderDto) _then) = _$OrderDtoCopyWithImpl;
@useResult
$Res call({
 String id, String customerId, String branchId, String status, double subtotal, double deliveryFee, double total, double discount, List<OrderItemDto> items, DateTime createdAt, String? restaurantName, String? deliveryAddress, double? deliveryLat, double? deliveryLng, String? paymentMethod, int? estimatedMinutes, String? driverName, String? driverPhone, double? driverLat, double? driverLng
});




}
/// @nodoc
class _$OrderDtoCopyWithImpl<$Res>
    implements $OrderDtoCopyWith<$Res> {
  _$OrderDtoCopyWithImpl(this._self, this._then);

  final OrderDto _self;
  final $Res Function(OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? branchId = null,Object? status = null,Object? subtotal = null,Object? deliveryFee = null,Object? total = null,Object? discount = null,Object? items = null,Object? createdAt = null,Object? restaurantName = freezed,Object? deliveryAddress = freezed,Object? deliveryLat = freezed,Object? deliveryLng = freezed,Object? paymentMethod = freezed,Object? estimatedMinutes = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? driverLat = freezed,Object? driverLng = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,restaurantName: freezed == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String?,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String?,deliveryLat: freezed == deliveryLat ? _self.deliveryLat : deliveryLat // ignore: cast_nullable_to_non_nullable
as double?,deliveryLng: freezed == deliveryLng ? _self.deliveryLng : deliveryLng // ignore: cast_nullable_to_non_nullable
as double?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,estimatedMinutes: freezed == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,driverLat: freezed == driverLat ? _self.driverLat : driverLat // ignore: cast_nullable_to_non_nullable
as double?,driverLng: freezed == driverLng ? _self.driverLng : driverLng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDto].
extension OrderDtoPatterns on OrderDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String customerId,  String branchId,  String status,  double subtotal,  double deliveryFee,  double total,  double discount,  List<OrderItemDto> items,  DateTime createdAt,  String? restaurantName,  String? deliveryAddress,  double? deliveryLat,  double? deliveryLng,  String? paymentMethod,  int? estimatedMinutes,  String? driverName,  String? driverPhone,  double? driverLat,  double? driverLng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.customerId,_that.branchId,_that.status,_that.subtotal,_that.deliveryFee,_that.total,_that.discount,_that.items,_that.createdAt,_that.restaurantName,_that.deliveryAddress,_that.deliveryLat,_that.deliveryLng,_that.paymentMethod,_that.estimatedMinutes,_that.driverName,_that.driverPhone,_that.driverLat,_that.driverLng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String customerId,  String branchId,  String status,  double subtotal,  double deliveryFee,  double total,  double discount,  List<OrderItemDto> items,  DateTime createdAt,  String? restaurantName,  String? deliveryAddress,  double? deliveryLat,  double? deliveryLng,  String? paymentMethod,  int? estimatedMinutes,  String? driverName,  String? driverPhone,  double? driverLat,  double? driverLng)  $default,) {final _that = this;
switch (_that) {
case _OrderDto():
return $default(_that.id,_that.customerId,_that.branchId,_that.status,_that.subtotal,_that.deliveryFee,_that.total,_that.discount,_that.items,_that.createdAt,_that.restaurantName,_that.deliveryAddress,_that.deliveryLat,_that.deliveryLng,_that.paymentMethod,_that.estimatedMinutes,_that.driverName,_that.driverPhone,_that.driverLat,_that.driverLng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String customerId,  String branchId,  String status,  double subtotal,  double deliveryFee,  double total,  double discount,  List<OrderItemDto> items,  DateTime createdAt,  String? restaurantName,  String? deliveryAddress,  double? deliveryLat,  double? deliveryLng,  String? paymentMethod,  int? estimatedMinutes,  String? driverName,  String? driverPhone,  double? driverLat,  double? driverLng)?  $default,) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.customerId,_that.branchId,_that.status,_that.subtotal,_that.deliveryFee,_that.total,_that.discount,_that.items,_that.createdAt,_that.restaurantName,_that.deliveryAddress,_that.deliveryLat,_that.deliveryLng,_that.paymentMethod,_that.estimatedMinutes,_that.driverName,_that.driverPhone,_that.driverLat,_that.driverLng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDto implements OrderDto {
  const _OrderDto({required this.id, required this.customerId, required this.branchId, required this.status, required this.subtotal, required this.deliveryFee, required this.total, required this.discount, required final  List<OrderItemDto> items, required this.createdAt, this.restaurantName, this.deliveryAddress, this.deliveryLat, this.deliveryLng, this.paymentMethod, this.estimatedMinutes, this.driverName, this.driverPhone, this.driverLat, this.driverLng}): _items = items;
  factory _OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

@override final  String id;
@override final  String customerId;
@override final  String branchId;
@override final  String status;
@override final  double subtotal;
@override final  double deliveryFee;
@override final  double total;
@override final  double discount;
 final  List<OrderItemDto> _items;
@override List<OrderItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime createdAt;
@override final  String? restaurantName;
@override final  String? deliveryAddress;
@override final  double? deliveryLat;
@override final  double? deliveryLng;
@override final  String? paymentMethod;
@override final  int? estimatedMinutes;
@override final  String? driverName;
@override final  String? driverPhone;
@override final  double? driverLat;
@override final  double? driverLng;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDtoCopyWith<_OrderDto> get copyWith => __$OrderDtoCopyWithImpl<_OrderDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.discount, discount) || other.discount == discount)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.deliveryLat, deliveryLat) || other.deliveryLat == deliveryLat)&&(identical(other.deliveryLng, deliveryLng) || other.deliveryLng == deliveryLng)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.driverLat, driverLat) || other.driverLat == driverLat)&&(identical(other.driverLng, driverLng) || other.driverLng == driverLng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,branchId,status,subtotal,deliveryFee,total,discount,const DeepCollectionEquality().hash(_items),createdAt,restaurantName,deliveryAddress,deliveryLat,deliveryLng,paymentMethod,estimatedMinutes,driverName,driverPhone,driverLat,driverLng]);

@override
String toString() {
  return 'OrderDto(id: $id, customerId: $customerId, branchId: $branchId, status: $status, subtotal: $subtotal, deliveryFee: $deliveryFee, total: $total, discount: $discount, items: $items, createdAt: $createdAt, restaurantName: $restaurantName, deliveryAddress: $deliveryAddress, deliveryLat: $deliveryLat, deliveryLng: $deliveryLng, paymentMethod: $paymentMethod, estimatedMinutes: $estimatedMinutes, driverName: $driverName, driverPhone: $driverPhone, driverLat: $driverLat, driverLng: $driverLng)';
}


}

/// @nodoc
abstract mixin class _$OrderDtoCopyWith<$Res> implements $OrderDtoCopyWith<$Res> {
  factory _$OrderDtoCopyWith(_OrderDto value, $Res Function(_OrderDto) _then) = __$OrderDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String customerId, String branchId, String status, double subtotal, double deliveryFee, double total, double discount, List<OrderItemDto> items, DateTime createdAt, String? restaurantName, String? deliveryAddress, double? deliveryLat, double? deliveryLng, String? paymentMethod, int? estimatedMinutes, String? driverName, String? driverPhone, double? driverLat, double? driverLng
});




}
/// @nodoc
class __$OrderDtoCopyWithImpl<$Res>
    implements _$OrderDtoCopyWith<$Res> {
  __$OrderDtoCopyWithImpl(this._self, this._then);

  final _OrderDto _self;
  final $Res Function(_OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? branchId = null,Object? status = null,Object? subtotal = null,Object? deliveryFee = null,Object? total = null,Object? discount = null,Object? items = null,Object? createdAt = null,Object? restaurantName = freezed,Object? deliveryAddress = freezed,Object? deliveryLat = freezed,Object? deliveryLng = freezed,Object? paymentMethod = freezed,Object? estimatedMinutes = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? driverLat = freezed,Object? driverLng = freezed,}) {
  return _then(_OrderDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,restaurantName: freezed == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String?,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String?,deliveryLat: freezed == deliveryLat ? _self.deliveryLat : deliveryLat // ignore: cast_nullable_to_non_nullable
as double?,deliveryLng: freezed == deliveryLng ? _self.deliveryLng : deliveryLng // ignore: cast_nullable_to_non_nullable
as double?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,estimatedMinutes: freezed == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,driverLat: freezed == driverLat ? _self.driverLat : driverLat // ignore: cast_nullable_to_non_nullable
as double?,driverLng: freezed == driverLng ? _self.driverLng : driverLng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$OrderItemDto {

 String get menuItemId; String get itemName; int get quantity; double get unitPrice; double get totalPrice; List<dynamic>? get selectedModifiers; String? get notes;
/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemDtoCopyWith<OrderItemDto> get copyWith => _$OrderItemDtoCopyWithImpl<OrderItemDto>(this as OrderItemDto, _$identity);

  /// Serializes this OrderItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemDto&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&const DeepCollectionEquality().equals(other.selectedModifiers, selectedModifiers)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,itemName,quantity,unitPrice,totalPrice,const DeepCollectionEquality().hash(selectedModifiers),notes);

@override
String toString() {
  return 'OrderItemDto(menuItemId: $menuItemId, itemName: $itemName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, selectedModifiers: $selectedModifiers, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $OrderItemDtoCopyWith<$Res>  {
  factory $OrderItemDtoCopyWith(OrderItemDto value, $Res Function(OrderItemDto) _then) = _$OrderItemDtoCopyWithImpl;
@useResult
$Res call({
 String menuItemId, String itemName, int quantity, double unitPrice, double totalPrice, List<dynamic>? selectedModifiers, String? notes
});




}
/// @nodoc
class _$OrderItemDtoCopyWithImpl<$Res>
    implements $OrderItemDtoCopyWith<$Res> {
  _$OrderItemDtoCopyWithImpl(this._self, this._then);

  final OrderItemDto _self;
  final $Res Function(OrderItemDto) _then;

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItemId = null,Object? itemName = null,Object? quantity = null,Object? unitPrice = null,Object? totalPrice = null,Object? selectedModifiers = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,selectedModifiers: freezed == selectedModifiers ? _self.selectedModifiers : selectedModifiers // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemDto].
extension OrderItemDtoPatterns on OrderItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String menuItemId,  String itemName,  int quantity,  double unitPrice,  double totalPrice,  List<dynamic>? selectedModifiers,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
return $default(_that.menuItemId,_that.itemName,_that.quantity,_that.unitPrice,_that.totalPrice,_that.selectedModifiers,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String menuItemId,  String itemName,  int quantity,  double unitPrice,  double totalPrice,  List<dynamic>? selectedModifiers,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _OrderItemDto():
return $default(_that.menuItemId,_that.itemName,_that.quantity,_that.unitPrice,_that.totalPrice,_that.selectedModifiers,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String menuItemId,  String itemName,  int quantity,  double unitPrice,  double totalPrice,  List<dynamic>? selectedModifiers,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
return $default(_that.menuItemId,_that.itemName,_that.quantity,_that.unitPrice,_that.totalPrice,_that.selectedModifiers,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemDto implements OrderItemDto {
  const _OrderItemDto({required this.menuItemId, required this.itemName, required this.quantity, required this.unitPrice, required this.totalPrice, final  List<dynamic>? selectedModifiers, this.notes}): _selectedModifiers = selectedModifiers;
  factory _OrderItemDto.fromJson(Map<String, dynamic> json) => _$OrderItemDtoFromJson(json);

@override final  String menuItemId;
@override final  String itemName;
@override final  int quantity;
@override final  double unitPrice;
@override final  double totalPrice;
 final  List<dynamic>? _selectedModifiers;
@override List<dynamic>? get selectedModifiers {
  final value = _selectedModifiers;
  if (value == null) return null;
  if (_selectedModifiers is EqualUnmodifiableListView) return _selectedModifiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? notes;

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemDtoCopyWith<_OrderItemDto> get copyWith => __$OrderItemDtoCopyWithImpl<_OrderItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemDto&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&const DeepCollectionEquality().equals(other._selectedModifiers, _selectedModifiers)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,itemName,quantity,unitPrice,totalPrice,const DeepCollectionEquality().hash(_selectedModifiers),notes);

@override
String toString() {
  return 'OrderItemDto(menuItemId: $menuItemId, itemName: $itemName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, selectedModifiers: $selectedModifiers, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$OrderItemDtoCopyWith<$Res> implements $OrderItemDtoCopyWith<$Res> {
  factory _$OrderItemDtoCopyWith(_OrderItemDto value, $Res Function(_OrderItemDto) _then) = __$OrderItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String menuItemId, String itemName, int quantity, double unitPrice, double totalPrice, List<dynamic>? selectedModifiers, String? notes
});




}
/// @nodoc
class __$OrderItemDtoCopyWithImpl<$Res>
    implements _$OrderItemDtoCopyWith<$Res> {
  __$OrderItemDtoCopyWithImpl(this._self, this._then);

  final _OrderItemDto _self;
  final $Res Function(_OrderItemDto) _then;

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItemId = null,Object? itemName = null,Object? quantity = null,Object? unitPrice = null,Object? totalPrice = null,Object? selectedModifiers = freezed,Object? notes = freezed,}) {
  return _then(_OrderItemDto(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,selectedModifiers: freezed == selectedModifiers ? _self._selectedModifiers : selectedModifiers // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
