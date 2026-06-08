import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_helper/core/common/entities/receipt_item_entity.dart';

part 'receipt_item_model.freezed.dart';
part 'receipt_item_model.g.dart';

@freezed
abstract class ReceiptItemModel with _$ReceiptItemModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory ReceiptItemModel({
    String? name,
    double? quantity,
    double? unitPrice,
    double? totalPrice,
  }) = _ReceiptItemModel;

  factory ReceiptItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptItemModelFromJson(json);

  factory ReceiptItemModel.fromEntity(ReceiptItemEntity entity) {
    return ReceiptItemModel(
      name: entity.name,
      quantity: entity.quantity,
      unitPrice: entity.unitPrice,
      totalPrice: entity.totalPrice,
    );
  }
}

extension ReceiptItemModelMapper on ReceiptItemModel {
  ReceiptItemEntity toEntity() => ReceiptItemEntity(
    name: name,
    quantity: quantity,
    unitPrice: unitPrice,
    totalPrice: totalPrice,
  );
}
