import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/common/models/receipt_model/receipt_model.dart';
import 'package:receipt_helper/core/services/google_api_service.dart';
import 'package:receipt_helper/core/services/receipt_service.dart';
import 'package:receipt_helper/core/services/user_service.dart';
import 'package:receipt_helper/core/services/local_keys_service.dart';

abstract class BaseReceiptReviewRemoteDataSource {
  Future<void> saveReceipt(
    ReceiptModel receipt, {
    String? sheetId,
    String? sheetName,
  });
}

@LazySingleton(as: BaseReceiptReviewRemoteDataSource)
class ReceiptReviewRemoteDataSource
    implements BaseReceiptReviewRemoteDataSource {
  final LocalKeysService _localKeysService;
  final GetStorage _getStorage;
  final ReceiptService _receiptService;
  final UserService _userService;
  final GoogleApiService _googleApiService;

  ReceiptReviewRemoteDataSource(
    this._localKeysService,
    this._getStorage,
    this._googleApiService,
    this._receiptService,
    this._userService,
  );

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
    if (toUpdateList.any((element) => element == receipt)) return;
    toUpdateList.add(receipt);
    await _getStorage.write(
      _localKeysService.receiptsData,
      toUpdateList.map((e) => e.toJson()).toList(),
    );
  }
}
