import 'dart:developer';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/services/user_service.dart';
import 'package:receipt_helper/core/services/local_keys_service.dart';

abstract class BaseLoadingRemoteDataSource {
  Future<void> getLoading();
}

@LazySingleton(as: BaseLoadingRemoteDataSource)
class LoadingRemoteDataSource implements BaseLoadingRemoteDataSource {
  final GetStorage _getStorage;
  final UserService _userService;
  final LocalKeysService _localKeysService;
  final GoogleSignIn _googleSignIn;

  LoadingRemoteDataSource(
    this._localKeysService,
    this._getStorage,
    this._userService,
    this._googleSignIn,
  );

  @override
  Future<void> getLoading() async {
    if (await _getStorage.read(_localKeysService.isLoggedIn) != true) {
      throw Exception('Not logged in');
    }
    final account = await _googleSignIn.attemptLightweightAuthentication(
      reportAllExceptions: true,
    );
    if (account == null) throw Exception('Not Authenticated');
    final authorization = await account.authorizationClient
        .authorizationForScopes([
          'email',
          'profile',
          SheetsApi.spreadsheetsScope,
        ]);
    final client = authorization?.authClient(
      scopes: [SheetsApi.spreadsheetsScope],
    );
    log(client?.credentials.accessToken.toString() ?? 'null');
    if (client?.credentials.accessToken == null) {
      throw Exception('Not Authorized');
    }

    final saveUserInfo = <Future>[
      _getStorage.write(
        _localKeysService.accessToken,
        authorization?.accessToken,
      ),
      _getStorage.write(_localKeysService.userId, account.id),
      _getStorage.write(_localKeysService.userEmail, account.email),
      _getStorage.write(_localKeysService.userName, account.displayName),
      _getStorage.write(_localKeysService.isLoggedIn, true),
    ];
    await Future.wait(saveUserInfo, eagerError: true);
    _userService.registerClient = client;
    _userService.registerAccount = account;
    log(_userService.currentClient.toString());
  }
}
