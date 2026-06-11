import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'user_sheets_di.config.dart'; 

@InjectableInit(
  initializerName: 'initUserSheetsSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/user_sheets'],
)
void configureUserSheetsSub(GetIt getIt) {
  getIt.initUserSheetsSub();
}
