import 'dart:async';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/common/models/receipt_model/receipt_model.dart';
import 'package:receipt_helper/core/services/local_keys_service.dart';

@Singleton(order: 2)
class ReceiptService {
  List<ReceiptModel>? _receipts;
  final GetStorage _getStorage;
  final LocalKeysService _localKeysService;
  late final StreamController<List<ReceiptModel>?> _baseReceipts;
  late final StreamSubscription _subscription;

  ReceiptService(this._getStorage, this._localKeysService) {
    initializeStream();
  }

  void initializeStream() {
    _baseReceipts = StreamController.broadcast(
      onListen: () => _baseReceipts.add(
        dataConverter(_getStorage.read(_localKeysService.receiptsData)),
      ),
      onCancel: () => _subscription.cancel(),
    );

    _getStorage.listenKey(_localKeysService.receiptsData, (value) {
      _baseReceipts.add(dataConverter(value));
    });
  }

  Future<void> write() async {
    await Future.delayed(Duration(seconds: 2));
    await _getStorage.write(_localKeysService.receiptsData, []);
  }

  List<ReceiptModel>? dataConverter<T>(T? data) {
    if (data != null) {
      log(data.toString());
      _receipts = (data as List)
          .map((e) => ReceiptModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      return _receipts;
    } else {
      _receipts = [];
      return _receipts;
    }
  }

  List<ReceiptModel>? get localReceipts => _receipts;

  Stream<List<ReceiptModel>?> get receiptsListen => _baseReceipts.stream;

  void dispose() {
    _subscription.cancel();
    _baseReceipts.close();
  }
}
