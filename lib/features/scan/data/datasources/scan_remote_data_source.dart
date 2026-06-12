import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/common/models/receipt_model/receipt_model.dart';
import 'package:receipt_helper/core/services/open_ai_service.dart';

abstract class BaseScanRemoteDataSource {
  Future<ReceiptModel> getScan(String imagePath);
}

@LazySingleton(as: BaseScanRemoteDataSource)
class ScanRemoteDataSource implements BaseScanRemoteDataSource {
  final OpenAiService _openAiService;

  ScanRemoteDataSource(this._openAiService);

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
}
