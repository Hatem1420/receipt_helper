import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/home/domain/entities/home_entity.dart';

abstract class HomeRepositoryDomain {
    Future<Result<List<HomeEntity>, Failure>> getHome();
}
