import 'package:equatable/equatable.dart';

class TotalEntity extends Equatable {
  final double? subTotalModel;
  final double? discount;
  final double? tax;
  final double? serviceCharge;
  final double? total;

  const TotalEntity({
    this.subTotalModel,
    this.discount,
    this.tax,
    this.serviceCharge,
    this.total,
  });

  @override
  List<Object?> get props => [
    subTotalModel,
    discount,
    tax,
    serviceCharge,
    total,
  ];
}
