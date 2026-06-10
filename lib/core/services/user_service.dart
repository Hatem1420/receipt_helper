import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as gapis;

@singleton
class UserService {
  GoogleSignInAccount? _account;
  gapis.AuthClient? _authClient;

  set registerAccount(GoogleSignInAccount? newAccount) => _account = newAccount;

  GoogleSignInAccount? get currentAccount => _account;

  set registerClient(gapis.AuthClient? newClient) => _authClient = newClient;

  gapis.AuthClient? get currentClient => _authClient;

  void clearAccount() => _account = null;
}
