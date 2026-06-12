import 'package:equatable/equatable.dart';

abstract class ReceiptReviewState extends Equatable {
  const ReceiptReviewState();

  @override
  List<Object?> get props => [];
}

class ReceiptReviewInitialState extends ReceiptReviewState {}
class ReceiptReviewSuccessState extends ReceiptReviewState {}
class ReceiptReviewLoadingState extends ReceiptReviewState {}


class ReceiptReviewErrorState extends ReceiptReviewState {
  final String message;
  const ReceiptReviewErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

