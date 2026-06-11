import 'dart:developer';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/services/user_service.dart';
import 'package:receipt_helper/core/services/local_keys_service.dart';

abstract class BaseAuthRemoteDataSource {
  Future<void> getAuth();
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final GoogleSignIn _googleSignIn;
  final UserService _userService;
  final LocalKeysService _localKeysService;
  final GetStorage _getStorage;

  AuthRemoteDataSource(
    this._googleSignIn,
    this._userService,
    this._getStorage,
    this._localKeysService,
  );

  @override
  Future<void> getAuth() async {
    final account = await _googleSignIn.authenticate();

    log(account.authentication.idToken.toString());

    GoogleSignInClientAuthorization? authorization =
        await account.authorizationClient.authorizationForScopes([
          'email',
          'profile',
          SheetsApi.spreadsheetsScope,
          SheetsApi.driveReadonlyScope
        ]) ??
        await account.authorizationClient.authorizeScopes([
          'email',
          'profile',
          SheetsApi.spreadsheetsScope,
          SheetsApi.driveReadonlyScope
        ]);
    final client = authorization.authClient(scopes: []);

    final saveUserInfo = <Future>[
      _getStorage.write(
        _localKeysService.accessToken,
        authorization.accessToken,
      ),
      _getStorage.write(_localKeysService.userId, account.id),
      _getStorage.write(_localKeysService.userEmail, account.email),
      _getStorage.write(_localKeysService.userName, account.displayName),
      _getStorage.write(_localKeysService.isLoggedIn, true),
    ];
    await Future.wait(saveUserInfo, eagerError: true);
    _userService.registerClient = client;
    _userService.registerAccount = account;
  }
}
