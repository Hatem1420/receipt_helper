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
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:receipt_helper/core/services/local_keys_service.dart' as _i540;
import 'package:receipt_helper/core/services/user_service.dart' as _i852;
import 'package:receipt_helper/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i444;
import 'package:receipt_helper/features/auth/data/repositories/auth_repository_data.dart'
    as _i331;
import 'package:receipt_helper/features/auth/domain/repositories/auth_repository_domain.dart'
    as _i713;
import 'package:receipt_helper/features/auth/domain/use_cases/auth_use_case.dart'
    as _i37;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAuth({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i444.BaseAuthRemoteDataSource>(
      () => _i444.AuthRemoteDataSource(
        gh<_i116.GoogleSignIn>(),
        gh<_i852.UserService>(),
        gh<_i792.GetStorage>(),
        gh<_i540.LocalKeysService>(),
      ),
    );
    gh.lazySingleton<_i713.AuthRepositoryDomain>(
      () => _i331.AuthRepositoryData(gh<_i444.BaseAuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i37.AuthUseCase>(
      () => _i37.AuthUseCase(gh<_i713.AuthRepositoryDomain>()),
    );
    return this;
  }
}
