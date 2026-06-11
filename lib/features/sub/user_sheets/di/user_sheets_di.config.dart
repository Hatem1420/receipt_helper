// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:receipt_helper/core/services/google_api_service.dart' as _i835;
import 'package:receipt_helper/core/services/user_service.dart' as _i852;
import 'package:receipt_helper/features/sub/user_sheets/data/datasources/user_sheets_remote_data_source.dart'
    as _i628;
import 'package:receipt_helper/features/sub/user_sheets/data/repositories/user_sheets_repository_data.dart'
    as _i476;
import 'package:receipt_helper/features/sub/user_sheets/domain/repositories/user_sheets_repository_domain.dart'
    as _i947;
import 'package:receipt_helper/features/sub/user_sheets/domain/use_cases/user_sheets_use_case.dart'
    as _i319;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initUserSheetsSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i628.BaseUserSheetsRemoteDataSource>(
      () => _i628.UserSheetsRemoteDataSource(
        gh<_i852.UserService>(),
        gh<_i835.GoogleApiService>(),
      ),
    );
    gh.lazySingleton<_i947.UserSheetsRepositoryDomain>(
      () => _i476.UserSheetsRepositoryData(
        gh<_i628.BaseUserSheetsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i319.UserSheetsUseCase>(
      () => _i319.UserSheetsUseCase(gh<_i947.UserSheetsRepositoryDomain>()),
    );
    return this;
  }
}
