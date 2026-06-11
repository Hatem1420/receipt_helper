import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/common/models/receipt_model/receipt_model.dart';
import 'package:receipt_helper/core/services/google_api_service.dart';
import 'package:receipt_helper/core/services/local_keys_service.dart';
import 'package:receipt_helper/core/services/open_ai_service.dart';
import 'package:receipt_helper/core/services/receipt_service.dart';
import 'package:receipt_helper/core/services/user_service.dart';

abstract class BaseScanRemoteDataSource {
  Future<ReceiptModel> getScan(String imagePath);
  Future<void> saveReceipt(
    ReceiptModel receipt, {
    String? sheetId,
    String? sheetName,
  });
}

@LazySingleton(as: BaseScanRemoteDataSource)
class ScanRemoteDataSource implements BaseScanRemoteDataSource {
  final OpenAiService _openAiService;
  final LocalKeysService _localKeysService;
  final GetStorage _getStorage;
  final ReceiptService _receiptService;
  final UserService _userService;
  final GoogleApiService _googleApiService;

  ScanRemoteDataSource(
    this._localKeysService,
    this._openAiService,
    this._getStorage,
    this._receiptService,
    this._userService,
    this._googleApiService,
  );

  @override
  Future<ReceiptModel> getScan(String imagePath) async {
    final receipt = await _openAiService.getReceipt(imagePath: imagePath);
    /* 
    {
      "merchant": {
        "name": "شركة اسطنبول شيش كباب لتقديم الوجبات",
        "branch": null,
        "tax_number": "311407173300003",
        "phone": null,
        "address": null,
      },
      "receipt": {
        "receipt_number": null,
        "invoice_number": "INV-2026/21884",
        "date": "2026-06-02",
        "time": "11:53:29",
        "currency": "SAR",
        "payment_method": "شبكة",
      },
      "totals": {
        "subtotal": 6.96,
        "discount": null,
        "tax": 1.04,
        "service_charge": null,
        "total": 8.00,
      },
      "items": [
        {
          "name": "ساندوتش كباب لحم",
          "quantity": 1,
          "unit_price": 8.00,
          "total_price": 8.00,
        },
      ],
      "metadata": {"language": "ar", "confidence": 0.95},
    };
 */
    return ReceiptModel.fromJson(receipt);
  }

  @override
  Future<void> saveReceipt(
    ReceiptModel receipt, {
    String? sheetId,
    String? sheetName,
  }) async {
    await _googleApiService.appendRow(
      spreadsheetId: sheetId,
      sheetName: sheetName,
      values: receipt.toSheetRow(),
      client: _userService.currentClient!,
    );
    final toUpdateList = _receiptService.localReceipts ?? [];
    toUpdateList.add(receipt);
    await _getStorage.write(
      _localKeysService.receiptsData,
      toUpdateList.map((e) => e.toJson()).toList(),
    );
  }
}
