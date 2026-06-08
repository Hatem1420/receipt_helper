import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/common/models/merchant_model/merchant_model.dart';
import 'package:receipt_helper/core/common/models/receipt_info_model/receipt_info_model.dart';
import 'package:receipt_helper/core/common/models/receipt_item_model/receipt_item_model.dart';
import 'package:receipt_helper/core/common/models/total_model/total_model.dart';

part 'receipt_model.freezed.dart';
part 'receipt_model.g.dart';

@freezed
abstract class ReceiptModel with _$ReceiptModel {
  const factory ReceiptModel({
    MerchantModel? merchant,
    @JsonKey(name: 'receipt') ReceiptInfoModel? receiptInfo,
    TotalModel? totals,
    @Default([]) List<ReceiptItemModel> items,
  }) = _ReceiptModel;

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);

  factory ReceiptModel.fromEntity(ReceiptEntity entity) {
    return ReceiptModel(
      merchant: MerchantModel.fromEntity(entity.merchant),
      receiptInfo: ReceiptInfoModel.fromEntity(entity.receiptInfo),
      totals: TotalModel.fromEntity(entity.totals),
      items: entity.items.map((e) => ReceiptItemModel.fromEntity(e)).toList(),
    );
  }
}

extension ReceiptModelMapper on ReceiptModel {
  ReceiptEntity toEntity() => ReceiptEntity(
    merchant: merchant?.toEntity(),
    receiptInfo: receiptInfo?.toEntity(),
    totals: totals?.toEntity(),
    items: items.map((e) => e.toEntity()).toList(),
  );
}
