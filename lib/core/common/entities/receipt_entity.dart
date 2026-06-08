import 'package:equatable/equatable.dart';
import 'package:receipt_helper/core/common/entities/merchant_entity.dart';
import 'package:receipt_helper/core/common/entities/receipt_info_entity.dart';
import 'package:receipt_helper/core/common/entities/receipt_item_entity.dart';
import 'package:receipt_helper/core/common/entities/total_entity.dart';

class ReceiptEntity extends Equatable {
  final MerchantEntity? merchant;
  final ReceiptInfoEntity? receiptInfo;
  final TotalEntity? totals;
  final List<ReceiptItemEntity> items;

  const ReceiptEntity({
    this.merchant,
    this.receiptInfo,
    this.totals,
    required this.items,
  });

  @override
  List<Object?> get props => [merchant, receiptInfo, totals, items];
}
