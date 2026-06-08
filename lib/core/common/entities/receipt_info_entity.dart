import 'package:equatable/equatable.dart';

class ReceiptInfoEntity extends Equatable {
  final String? receiptNumber;
  final String? invoiceNumber;
  final String? date;
  final String? time;
  final String? currency;
  final String? paymentMethod;

  const ReceiptInfoEntity({
    this.receiptNumber,
    this.invoiceNumber,
    this.date,
    this.time,
    this.currency,
    this.paymentMethod,
  });

  @override
  List<Object?> get props => [
    receiptNumber,
    invoiceNumber,
    date,
    time,
    currency,
    paymentMethod,
  ];
}
