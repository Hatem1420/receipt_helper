import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receipt_helper/features/scan/domain/use_cases/scan_use_case.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  final ScanUseCase _scanUseCase;

  ScanCubit(this._scanUseCase) : super(ScanInitialState());

  Future<void> getScanMethod(String imagePath) async {
    emit(ScanLoadingState());
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
      getScanMethod(image.path);
    }
  }

  @override
  Future<void> close() {
    //
    return super.close();
  }
}
