// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceiptItemModel _$ReceiptItemModelFromJson(Map<String, dynamic> json) =>
    _ReceiptItemModel(
      name: json['name'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      unitPrice: (json['unit_price'] as num?)?.toDouble(),
      totalPrice: (json['total_price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ReceiptItemModelToJson(_ReceiptItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'total_price': instance.totalPrice,
    };
