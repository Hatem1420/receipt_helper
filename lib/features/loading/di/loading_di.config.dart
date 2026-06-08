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
import 'package:receipt_helper/core/services/local_keys_service.dart' as _i540;
import 'package:receipt_helper/features/loading/data/datasources/loading_remote_data_source.dart'
    as _i595;
import 'package:receipt_helper/features/loading/data/repositories/loading_repository_data.dart'
    as _i156;
import 'package:receipt_helper/features/loading/domain/repositories/loading_repository_domain.dart'
    as _i140;
import 'package:receipt_helper/features/loading/domain/use_cases/loading_use_case.dart'
    as _i30;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLoading({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i595.BaseLoadingRemoteDataSource>(
      () => _i595.LoadingRemoteDataSource(
        gh<_i540.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i140.LoadingRepositoryDomain>(
      () =>
          _i156.LoadingRepositoryData(gh<_i595.BaseLoadingRemoteDataSource>()),
    );
    gh.lazySingleton<_i30.LoadingUseCase>(
      () => _i30.LoadingUseCase(gh<_i140.LoadingRepositoryDomain>()),
    );
    return this;
  }
}
