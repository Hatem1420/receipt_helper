import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v2.dart';
import 'package:injectable/injectable.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as gapis;

@singleton
class UserService {
  GoogleSignInAccount? _account;
  gapis.AuthClient? _authClient;
  List<File>? _spreadsheets;
  File? _latestSheetUsed;

  set registerAccount(GoogleSignInAccount? newAccount) => _account = newAccount;

  GoogleSignInAccount? get currentAccount => _account;

  set registerClient(gapis.AuthClient? newClient) => _authClient = newClient;

  gapis.AuthClient? get currentClient => _authClient;

  set registerSpreadsheets(List<File>? newSpreadsheets) =>
      _spreadsheets = newSpreadsheets;

  List<File>? get currentSpreadsheets => _spreadsheets;

  set registerLatestSheetUsed(File? newSpreadsheet) =>
      _latestSheetUsed = newSpreadsheet;

  File? get latestSheetUsed => _latestSheetUsed;

  void clearAccount() => _account = null;
}
