import 'package:equatable/equatable.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ReceiptEntity> receipts;
  final DateTime emittedAt;

  const HomeSuccessState({required this.receipts, required this.emittedAt});

  @override
  List<Object?> get props => [receipts, emittedAt];
}

class HomeErrorState extends HomeState {
  final String message;
  const HomeErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
