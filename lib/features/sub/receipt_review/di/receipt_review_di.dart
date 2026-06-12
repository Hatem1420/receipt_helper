import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'receipt_review_di.config.dart'; 

@InjectableInit(
  initializerName: 'initReceiptReview',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/receipt_review'],
)
void configureReceiptReview(GetIt getIt) {
  getIt.initReceiptReview();
}
