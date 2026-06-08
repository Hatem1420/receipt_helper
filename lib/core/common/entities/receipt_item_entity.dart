import 'package:equatable/equatable.dart';

class ReceiptItemEntity extends Equatable {
  final String? name;
  final double? quantity;
  final double? unitPrice;
  final double? totalPrice;

  const ReceiptItemEntity({
    this.name,
    this.quantity,
    this.unitPrice,
    this.totalPrice,
  });

  @override
  List<Object?> get props => [name, quantity, unitPrice, totalPrice];
}
