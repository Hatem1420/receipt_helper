import 'package:equatable/equatable.dart';

class MerchantEntity extends Equatable {
  final String? name;
  final String? branch;
  final String? taxNumber;
  final String? phone;
  final String? address;

  const MerchantEntity({
    this.name,
    this.branch,
    this.taxNumber,
    this.phone,
    this.address,
  });

  @override
  List<Object?> get props => [name, branch, taxNumber, phone, address];
}
