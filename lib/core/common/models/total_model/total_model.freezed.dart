// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'total_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TotalModel {

@JsonKey(name: 'subtotal') double? get subTotalModel; double? get discount; double? get tax; double? get serviceCharge; double? get total;
/// Create a copy of TotalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotalModelCopyWith<TotalModel> get copyWith => _$TotalModelCopyWithImpl<TotalModel>(this as TotalModel, _$identity);

  /// Serializes this TotalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotalModel&&(identical(other.subTotalModel, subTotalModel) || other.subTotalModel == subTotalModel)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.serviceCharge, serviceCharge) || other.serviceCharge == serviceCharge)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subTotalModel,discount,tax,serviceCharge,total);

@override
String toString() {
  return 'TotalModel(subTotalModel: $subTotalModel, discount: $discount, tax: $tax, serviceCharge: $serviceCharge, total: $total)';
}


}

/// @nodoc
abstract mixin class $TotalModelCopyWith<$Res>  {
  factory $TotalModelCopyWith(TotalModel value, $Res Function(TotalModel) _then) = _$TotalModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'subtotal') double? subTotalModel, double? discount, double? tax, double? serviceCharge, double? total
});




}
/// @nodoc
class _$TotalModelCopyWithImpl<$Res>
    implements $TotalModelCopyWith<$Res> {
  _$TotalModelCopyWithImpl(this._self, this._then);

  final TotalModel _self;
  final $Res Function(TotalModel) _then;

/// Create a copy of TotalModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subTotalModel = freezed,Object? discount = freezed,Object? tax = freezed,Object? serviceCharge = freezed,Object? total = freezed,}) {
  return _then(_self.copyWith(
subTotalModel: freezed == subTotalModel ? _self.subTotalModel : subTotalModel // ignore: cast_nullable_to_non_nullable
as double?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,tax: freezed == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double?,serviceCharge: freezed == serviceCharge ? _self.serviceCharge : serviceCharge // ignore: cast_nullable_to_non_nullable
as double?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TotalModel].
extension TotalModelPatterns on TotalModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TotalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TotalModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TotalModel value)  $default,){
final _that = this;
switch (_that) {
case _TotalModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TotalModel value)?  $default,){
final _that = this;
switch (_that) {
case _TotalModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'subtotal')  double? subTotalModel,  double? discount,  double? tax,  double? serviceCharge,  double? total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TotalModel() when $default != null:
return $default(_that.subTotalModel,_that.discount,_that.tax,_that.serviceCharge,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'subtotal')  double? subTotalModel,  double? discount,  double? tax,  double? serviceCharge,  double? total)  $default,) {final _that = this;
switch (_that) {
case _TotalModel():
return $default(_that.subTotalModel,_that.discount,_that.tax,_that.serviceCharge,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'subtotal')  double? subTotalModel,  double? discount,  double? tax,  double? serviceCharge,  double? total)?  $default,) {final _that = this;
switch (_that) {
case _TotalModel() when $default != null:
return $default(_that.subTotalModel,_that.discount,_that.tax,_that.serviceCharge,_that.total);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _TotalModel implements TotalModel {
  const _TotalModel({@JsonKey(name: 'subtotal') this.subTotalModel, this.discount, this.tax, this.serviceCharge, this.total});
  factory _TotalModel.fromJson(Map<String, dynamic> json) => _$TotalModelFromJson(json);

@override@JsonKey(name: 'subtotal') final  double? subTotalModel;
@override final  double? discount;
@override final  double? tax;
@override final  double? serviceCharge;
@override final  double? total;

/// Create a copy of TotalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TotalModelCopyWith<_TotalModel> get copyWith => __$TotalModelCopyWithImpl<_TotalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TotalModel&&(identical(other.subTotalModel, subTotalModel) || other.subTotalModel == subTotalModel)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.serviceCharge, serviceCharge) || other.serviceCharge == serviceCharge)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subTotalModel,discount,tax,serviceCharge,total);

@override
String toString() {
  return 'TotalModel(subTotalModel: $subTotalModel, discount: $discount, tax: $tax, serviceCharge: $serviceCharge, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TotalModelCopyWith<$Res> implements $TotalModelCopyWith<$Res> {
  factory _$TotalModelCopyWith(_TotalModel value, $Res Function(_TotalModel) _then) = __$TotalModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'subtotal') double? subTotalModel, double? discount, double? tax, double? serviceCharge, double? total
});




}
/// @nodoc
class __$TotalModelCopyWithImpl<$Res>
    implements _$TotalModelCopyWith<$Res> {
  __$TotalModelCopyWithImpl(this._self, this._then);

  final _TotalModel _self;
  final $Res Function(_TotalModel) _then;

/// Create a copy of TotalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subTotalModel = freezed,Object? discount = freezed,Object? tax = freezed,Object? serviceCharge = freezed,Object? total = freezed,}) {
  return _then(_TotalModel(
subTotalModel: freezed == subTotalModel ? _self.subTotalModel : subTotalModel // ignore: cast_nullable_to_non_nullable
as double?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,tax: freezed == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double?,serviceCharge: freezed == serviceCharge ? _self.serviceCharge : serviceCharge // ignore: cast_nullable_to_non_nullable
as double?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
