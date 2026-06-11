
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/features/scan/domain/use_cases/scan_use_case.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  final ScanUseCase _scanUseCase;

  ScanCubit(this._scanUseCase) : super(ScanInitialState());

  Future<void> getScanMethod(String imagePath) async {
    final result = await _scanUseCase.getScan(imagePath);
    result.when(
      (success) {
        emit(ScanSuccessState(receipt: success));
      },
      (whenError) {
        emit(ScanErrorState(message: whenError.message));
      },
    );
  }

  Future<void> capture() async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: .camera);
    if (image != null) {
      emit(ScanLoadingState());
      await getScanMethod(image.path);
    }
  }

  Future<void> saveReceipt(
    ReceiptEntity receipt, {
    String? sheetId,
    String? sheetName,
  }) async {
    emit(ScanLoadingState());
    final result = await _scanUseCase.saveReceipt(
      receipt,
      sheetId: sheetId,
      sheetName: sheetName,
    );
    result.when(
      (success) {
        emit(ScanSaveSuccessState());
      },
      (whenError) {
        emit(ScanErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //
    return super.close();
  }
}
