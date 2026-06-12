import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/features/sub/receipt_review/domain/use_cases/receipt_review_use_case.dart';
import 'package:receipt_helper/features/sub/receipt_review/presentation/cubit/receipt_review_state.dart';

class ReceiptReviewCubit extends Cubit<ReceiptReviewState> {
  final ReceiptReviewUseCase _receiptReviewUseCase;

  ReceiptReviewCubit(this._receiptReviewUseCase) : super(ReceiptReviewInitialState());

  Future<void> saveReceipt(
    ReceiptEntity receipt, {
    String? sheetId,
    String? sheetName,
  }) async {
    emit(ReceiptReviewLoadingState());
    final result = await _receiptReviewUseCase.saveReceipt(
      receipt,
      sheetId: sheetId,
      sheetName: sheetName,
    );
    result.when(
      (success) {
        emit(ReceiptReviewSuccessState());
      },
      (whenError) {
        emit(ReceiptReviewErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
