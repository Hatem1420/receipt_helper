import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:receipt_helper/core/services/local_keys_service.dart';
import 'package:receipt_helper/features/scan/data/models/scan_model.dart';
import 'package:receipt_helper/core/errors/network_exceptions.dart';


abstract class BaseScanRemoteDataSource {
  Future<ScanModel> getScan();
}


@LazySingleton(as: BaseScanRemoteDataSource)
class ScanRemoteDataSource implements BaseScanRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   ScanRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<ScanModel> getScan() async {
    try {
      return ScanModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
