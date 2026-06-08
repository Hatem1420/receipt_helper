// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceiptInfoModel {

 String? get receiptNumber; String? get invoiceNumber; String? get date; String? get time; String? get currency; String? get paymentMethod;
/// Create a copy of ReceiptInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptInfoModelCopyWith<ReceiptInfoModel> get copyWith => _$ReceiptInfoModelCopyWithImpl<ReceiptInfoModel>(this as ReceiptInfoModel, _$identity);

  /// Serializes this ReceiptInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptInfoModel&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiptNumber,invoiceNumber,date,time,currency,paymentMethod);

@override
String toString() {
  return 'ReceiptInfoModel(receiptNumber: $receiptNumber, invoiceNumber: $invoiceNumber, date: $date, time: $time, currency: $currency, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $ReceiptInfoModelCopyWith<$Res>  {
  factory $ReceiptInfoModelCopyWith(ReceiptInfoModel value, $Res Function(ReceiptInfoModel) _then) = _$ReceiptInfoModelCopyWithImpl;
@useResult
$Res call({
 String? receiptNumber, String? invoiceNumber, String? date, String? time, String? currency, String? paymentMethod
});




}
/// @nodoc
class _$ReceiptInfoModelCopyWithImpl<$Res>
    implements $ReceiptInfoModelCopyWith<$Res> {
  _$ReceiptInfoModelCopyWithImpl(this._self, this._then);

  final ReceiptInfoModel _self;
  final $Res Function(ReceiptInfoModel) _then;

/// Create a copy of ReceiptInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receiptNumber = freezed,Object? invoiceNumber = freezed,Object? date = freezed,Object? time = freezed,Object? currency = freezed,Object? paymentMethod = freezed,}) {
  return _then(_self.copyWith(
receiptNumber: freezed == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String?,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiptInfoModel].
extension ReceiptInfoModelPatterns on ReceiptInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? receiptNumber,  String? invoiceNumber,  String? date,  String? time,  String? currency,  String? paymentMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptInfoModel() when $default != null:
return $default(_that.receiptNumber,_that.invoiceNumber,_that.date,_that.time,_that.currency,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? receiptNumber,  String? invoiceNumber,  String? date,  String? time,  String? currency,  String? paymentMethod)  $default,) {final _that = this;
switch (_that) {
case _ReceiptInfoModel():
return $default(_that.receiptNumber,_that.invoiceNumber,_that.date,_that.time,_that.currency,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? receiptNumber,  String? invoiceNumber,  String? date,  String? time,  String? currency,  String? paymentMethod)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptInfoModel() when $default != null:
return $default(_that.receiptNumber,_that.invoiceNumber,_that.date,_that.time,_that.currency,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _ReceiptInfoModel implements ReceiptInfoModel {
  const _ReceiptInfoModel({this.receiptNumber, this.invoiceNumber, this.date, this.time, this.currency, this.paymentMethod});
  factory _ReceiptInfoModel.fromJson(Map<String, dynamic> json) => _$ReceiptInfoModelFromJson(json);

@override final  String? receiptNumber;
@override final  String? invoiceNumber;
@override final  String? date;
@override final  String? time;
@override final  String? currency;
@override final  String? paymentMethod;

/// Create a copy of ReceiptInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptInfoModelCopyWith<_ReceiptInfoModel> get copyWith => __$ReceiptInfoModelCopyWithImpl<_ReceiptInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptInfoModel&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiptNumber,invoiceNumber,date,time,currency,paymentMethod);

@override
String toString() {
  return 'ReceiptInfoModel(receiptNumber: $receiptNumber, invoiceNumber: $invoiceNumber, date: $date, time: $time, currency: $currency, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$ReceiptInfoModelCopyWith<$Res> implements $ReceiptInfoModelCopyWith<$Res> {
  factory _$ReceiptInfoModelCopyWith(_ReceiptInfoModel value, $Res Function(_ReceiptInfoModel) _then) = __$ReceiptInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String? receiptNumber, String? invoiceNumber, String? date, String? time, String? currency, String? paymentMethod
});




}
/// @nodoc
class __$ReceiptInfoModelCopyWithImpl<$Res>
    implements _$ReceiptInfoModelCopyWith<$Res> {
  __$ReceiptInfoModelCopyWithImpl(this._self, this._then);

  final _ReceiptInfoModel _self;
  final $Res Function(_ReceiptInfoModel) _then;

/// Create a copy of ReceiptInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiptNumber = freezed,Object? invoiceNumber = freezed,Object? date = freezed,Object? time = freezed,Object? currency = freezed,Object? paymentMethod = freezed,}) {
  return _then(_ReceiptInfoModel(
receiptNumber: freezed == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String?,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
