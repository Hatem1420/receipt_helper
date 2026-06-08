import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:receipt_helper/core/services/local_keys_service.dart';
import 'package:receipt_helper/features/loading/data/models/loading_model.dart';
import 'package:receipt_helper/core/errors/network_exceptions.dart';


abstract class BaseLoadingRemoteDataSource {
  Future<LoadingModel> getLoading();
}


@LazySingleton(as: BaseLoadingRemoteDataSource)
class LoadingRemoteDataSource implements BaseLoadingRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   LoadingRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<LoadingModel> getLoading() async {
    try {
      return LoadingModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
