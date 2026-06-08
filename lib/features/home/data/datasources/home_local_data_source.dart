import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/common/models/receipt_model/receipt_model.dart';
import 'package:receipt_helper/core/services/receipt_service.dart';

abstract class BaseHomeLocalDataSource {
  Stream<List<ReceiptModel>?> getHome();
}

@LazySingleton(as: BaseHomeLocalDataSource)
class HomeLocalDataSource implements BaseHomeLocalDataSource {
  final ReceiptService _receiptService;

  HomeLocalDataSource(this._receiptService);

  @override
  Stream<List<ReceiptModel>?> getHome() {
    return _receiptService.receiptsListen;
  }
}
