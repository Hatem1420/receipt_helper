import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> setup() async {
  //----------------------------------------------------------------------------
  await dotenv.load(fileName: ".env");
  //----------------------------------------------------------------------------
  await Supabase.initialize(
    url: dotenv.env['url_supabase'].toString(),
    anonKey: dotenv.env['key_supabase'].toString(),
  );
  //----------------------------------------------------------------------------
  await GetStorage.init();
  //----------------------------------------------------------------------------
  unawaited(
    GoogleSignIn.instance.initialize(
      serverClientId: dotenv.env['server_client_id'],
      clientId: dotenv.env['android_client_id'],
    ),
  );
}
