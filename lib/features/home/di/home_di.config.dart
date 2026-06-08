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
import 'package:receipt_helper/core/services/local_keys_service.dart' as _i540;
import 'package:receipt_helper/features/home/data/datasources/home_local_data_source.dart'
    as _i518;
import 'package:receipt_helper/features/home/data/datasources/home_remote_data_source.dart'
    as _i10;
import 'package:receipt_helper/features/home/data/repositories/home_repository_data.dart'
    as _i6;
import 'package:receipt_helper/features/home/domain/repositories/home_repository_domain.dart'
    as _i545;
import 'package:receipt_helper/features/home/domain/use_cases/home_use_case.dart'
    as _i901;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i518.BaseHomeLocalDataSource>(
      () => _i518.HomeLocalDataSource(
        gh<_i540.LocalKeysService>(),
        gh<_i792.GetStorage>(),
      ),
    );
    gh.lazySingleton<_i10.BaseHomeRemoteDataSource>(
      () => _i10.HomeRemoteDataSource(
        gh<_i540.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i545.HomeRepositoryDomain>(
      () => _i6.HomeRepositoryData(gh<_i518.BaseHomeLocalDataSource>()),
    );
    gh.lazySingleton<_i901.HomeUseCase>(
      () => _i901.HomeUseCase(gh<_i545.HomeRepositoryDomain>()),
    );
    return this;
  }
}
