import 'package:equatable/equatable.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

class ScanInitialState extends ScanState {}

class ScanSuccessState extends ScanState {
  final ReceiptEntity receipt;


  const ScanSuccessState({required this.receipt});

   @override
  List<Object?> get props => [receipt];
}

class ScanLoadingState extends ScanState {}

class ScanErrorState extends ScanState {
  final String message;
  const ScanErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
