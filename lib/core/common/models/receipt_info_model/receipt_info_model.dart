import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_helper/core/common/entities/receipt_info_entity.dart';

part 'receipt_info_model.freezed.dart';
part 'receipt_info_model.g.dart';

@freezed
abstract class ReceiptInfoModel with _$ReceiptInfoModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory ReceiptInfoModel({
    String? receiptNumber,
    String? invoiceNumber,
    String? date,
    String? time,
    String? currency,
    String? paymentMethod,
  }) = _ReceiptInfoModel;

  factory ReceiptInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptInfoModelFromJson(json);

  factory ReceiptInfoModel.fromEntity(ReceiptInfoEntity? entity) {
    return ReceiptInfoModel(
      receiptNumber: entity?.receiptNumber,
      invoiceNumber: entity?.invoiceNumber,
      date: entity?.date,
      currency: entity?.currency,
      time: entity?.time,
      paymentMethod: entity?.paymentMethod,
    );
  }
}

extension ReceiptInfoModelMapper on ReceiptInfoModel {
  ReceiptInfoEntity toEntity() => ReceiptInfoEntity(
    receiptNumber: receiptNumber,
    invoiceNumber: invoiceNumber,
    date: date,
    time: time,
    currency: currency,
    paymentMethod: paymentMethod,
  );
}
