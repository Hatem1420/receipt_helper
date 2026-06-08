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

  ReceiptService(this._getStorage, this._localKeysService) {
    initializeStream();
  }

  void initializeStream() {
    _baseReceipts = StreamController.broadcast();

    final storedData = _getStorage.read(_localKeysService.receiptsData);

    if (storedData != null) {
      print(storedData);
      _receipts = (storedData as List)
          .map((e) => ReceiptModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      Future.delayed(
        Duration(seconds: 3),
        () => _baseReceipts.sink.add(_receipts),
      );
    } else {
      //write();
    }

    try {
      _getStorage.listenKey(_localKeysService.receiptsData, (value) {
        if (value != null) {
          log(value.toString());
          _receipts = (storedData as List)
              .map((e) => ReceiptModel.fromJson(Map<String, dynamic>.from(e)))
              .toList();
        }
        Future.delayed(
          Duration(seconds: 3),
          () => _baseReceipts.sink.add(_receipts),
        );
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> write() async {
    await Future.delayed(Duration(seconds: 2));
    await _getStorage.write(_localKeysService.receiptsData, []);
  }

  List<ReceiptModel>? get localReceipts => _receipts;

  Stream<List<ReceiptModel>?> get receiptsListen => _baseReceipts.stream;

  void dispose() {
    _baseReceipts.close();
  }
}
