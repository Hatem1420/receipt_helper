import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receipt_helper/features/scan/domain/use_cases/scan_use_case.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_state.dart';
import 'package:receipt_recognition/receipt_recognition.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ScanCubit extends Cubit<ScanState> {
  final ScanUseCase _scanUseCase;
  ReceiptRecognizer? receiptRecognizer;

  ScanCubit(this._scanUseCase) : super(ScanInitialState()) {
    // Prefer layered options:
    // - extend: merge with defaults (user wins on duplicates)
    // - override: replace specific sections entirely
    // - tuning: override-only thresholds/knobs
    final options = ReceiptOptions.fromLayeredJson({
      "extend": {
        "storeNames": {"REWE CITY": "Rewe"},
      },
      "override": {
        "stopKeywords": ["Rückgeld", "Change"],
      },
      "tuning": {
        "optimizerConfidenceThreshold": 88,
        "optimizerStabilityThreshold": 45,
      },
    });

    // Create a receipt recognizer
    receiptRecognizer = ReceiptRecognizer(
      options: options,
      onScanComplete: (receipt) {
        // Handle the recognized receipt
        print('Store: ${receipt.store?.value}');
        print('Total: ${receipt.total?.formattedValue}');
        for (final position in receipt.positions) {
          print(
            '${position.product.formattedValue}: ${position.price.formattedValue}',
          );
        }
      },
      onScanUpdate: (progress) {
        // Track scanning progress
        print('Scan progress: ${progress.validationResult.matchPercentage}%');
        print('Added positions: ${progress.addedPositions.length}');
      },
    );
  }

  // Process an image Future
  processReceiptImage(InputImage inputImage) async {
    // You receive ongoing snapshots from processImage.
    // A snapshot is final when isValid && isConfirmed;
    // onScanComplete will fire at that point.
    final snapshot = await receiptRecognizer!.processImage(inputImage);
    if (snapshot.isValid && snapshot.isConfirmed) {
      ReceiptLogger.logReceipt(snapshot);
    }
  }

  Future<void> getScanMethod() async {
    final result = await _scanUseCase.getScan();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
        //here is when error result
      },
    );
  }

  Future<void> capture() async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: .camera);
    if (image != null) {
      emit(ScanLoadingState());
      final text = await processReceiptImage(
        InputImage.fromFilePath(image.path),
      );
      emit(ScanSuccessState());
      log(text.toString());
    }
  }

  @override
  Future<void> close() {
    receiptRecognizer?.close();
    return super.close();
  }
}
