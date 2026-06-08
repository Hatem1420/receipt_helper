// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) =>
    _ReceiptModel(
      merchant: json['merchant'] == null
          ? null
          : MerchantModel.fromJson(json['merchant'] as Map<String, dynamic>),
      receiptInfo: json['receipt'] == null
          ? null
          : ReceiptInfoModel.fromJson(json['receipt'] as Map<String, dynamic>),
      totals: json['totals'] == null
          ? null
          : TotalModel.fromJson(json['totals'] as Map<String, dynamic>),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ReceiptItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReceiptModelToJson(_ReceiptModel instance) =>
    <String, dynamic>{
      'merchant': instance.merchant?.toJson(),
      'receipt': instance.receiptInfo?.toJson(),
      'totals': instance.totals?.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
