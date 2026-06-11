// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;
import 'package:receipt_helper/core/services/google_api_service.dart' as _i835;
import 'package:receipt_helper/core/services/local_keys_service.dart' as _i540;
import 'package:receipt_helper/core/services/open_ai_service.dart' as _i152;
import 'package:receipt_helper/core/services/receipt_service.dart' as _i593;
import 'package:receipt_helper/core/services/user_service.dart' as _i852;
import 'package:receipt_helper/features/scan/data/datasources/scan_remote_data_source.dart'
    as _i628;
import 'package:receipt_helper/features/scan/data/repositories/scan_repository_data.dart'
    as _i203;
import 'package:receipt_helper/features/scan/domain/repositories/scan_repository_domain.dart'
    as _i199;
import 'package:receipt_helper/features/scan/domain/use_cases/scan_use_case.dart'
    as _i821;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initScan({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i628.BaseScanRemoteDataSource>(
      () => _i628.ScanRemoteDataSource(
        gh<_i540.LocalKeysService>(),
        gh<_i152.OpenAiService>(),
        gh<_i792.GetStorage>(),
        gh<_i593.ReceiptService>(),
        gh<_i852.UserService>(),
        gh<_i835.GoogleApiService>(),
      ),
    );
    gh.lazySingleton<_i199.ScanRepositoryDomain>(
      () => _i203.ScanRepositoryData(gh<_i628.BaseScanRemoteDataSource>()),
    );
    gh.lazySingleton<_i821.ScanUseCase>(
      () => _i821.ScanUseCase(gh<_i199.ScanRepositoryDomain>()),
    );
    return this;
  }
}
