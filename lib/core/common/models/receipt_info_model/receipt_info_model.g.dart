// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceiptInfoModel _$ReceiptInfoModelFromJson(Map<String, dynamic> json) =>
    _ReceiptInfoModel(
      receiptNumber: json['receipt_number'] as String?,
      invoiceNumber: json['invoice_number'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      currency: json['currency'] as String?,
      paymentMethod: json['payment_method'] as String?,
    );

Map<String, dynamic> _$ReceiptInfoModelToJson(_ReceiptInfoModel instance) =>
    <String, dynamic>{
      'receipt_number': instance.receiptNumber,
      'invoice_number': instance.invoiceNumber,
      'date': instance.date,
      'time': instance.time,
      'currency': instance.currency,
      'payment_method': instance.paymentMethod,
    };
