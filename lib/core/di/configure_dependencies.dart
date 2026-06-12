import 'package:get_it/get_it.dart';
import 'package:receipt_helper/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/features/scan/di/scan_di.dart';
import 'package:receipt_helper/features/home/di/home_di.dart';
import 'package:receipt_helper/features/loading/di/loading_di.dart';
import 'package:receipt_helper/features/auth/di/auth_di.dart';
import 'package:receipt_helper/features/sub/user_sheets/di/user_sheets_di.dart';
import 'package:receipt_helper/features/sub/receipt_review/di/receipt_review_di.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  generateForDir: ['lib/core'],
)
Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
  configureScan(getIt);
  configureHome(getIt);
  configureLoading(getIt);
  configureAuth(getIt);
    configureUserSheetsSub(getIt);
    configureReceiptReview(getIt);
}
