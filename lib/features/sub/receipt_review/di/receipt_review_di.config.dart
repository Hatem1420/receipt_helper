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
import 'package:receipt_helper/core/services/receipt_service.dart' as _i593;
import 'package:receipt_helper/core/services/user_service.dart' as _i852;
import 'package:receipt_helper/features/sub/receipt_review/data/datasources/receipt_review_remote_data_source.dart'
    as _i1064;
import 'package:receipt_helper/features/sub/receipt_review/data/repositories/receipt_review_repository_data.dart'
    as _i701;
import 'package:receipt_helper/features/sub/receipt_review/domain/repositories/receipt_review_repository_domain.dart'
    as _i683;
import 'package:receipt_helper/features/sub/receipt_review/domain/use_cases/receipt_review_use_case.dart'
    as _i247;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initReceiptReview({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1064.BaseReceiptReviewRemoteDataSource>(
      () => _i1064.ReceiptReviewRemoteDataSource(
        gh<_i540.LocalKeysService>(),
        gh<_i792.GetStorage>(),
        gh<_i835.GoogleApiService>(),
        gh<_i593.ReceiptService>(),
        gh<_i852.UserService>(),
      ),
    );
    gh.lazySingleton<_i683.ReceiptReviewRepositoryDomain>(
      () => _i701.ReceiptReviewRepositoryData(
        gh<_i1064.BaseReceiptReviewRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i247.ReceiptReviewUseCase>(
      () =>
          _i247.ReceiptReviewUseCase(gh<_i683.ReceiptReviewRepositoryDomain>()),
    );
    return this;
  }
}
