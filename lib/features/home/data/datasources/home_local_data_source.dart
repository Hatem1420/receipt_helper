import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/services/local_keys_service.dart';
import 'package:receipt_helper/features/home/data/models/home_model.dart';

abstract class BaseHomeLocalDataSource {
  Future<List<HomeModel>> getHome();
}

@LazySingleton(as: BaseHomeLocalDataSource)
class HomeLocalDataSource implements BaseHomeLocalDataSource {
  final LocalKeysService _localKeysService;
  final GetStorage _getStorage;

  HomeLocalDataSource(this._localKeysService, this._getStorage);

  @override
  Future<List<HomeModel>> getHome() async {
    final receipts = await _getStorage.read(_localKeysService.receiptsData);
    return receipts == null
        ? []
        : List.castFrom(receipts).map((e) => HomeModel.fromJson(e)).toList();
  }
}
