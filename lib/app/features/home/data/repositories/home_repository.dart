import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../src/core/Api/safe_api_call.dart';
import '../../../../../src/errors/failures/app_failures.dart';
import '../../domain/entities/get_products_params.dart';
import '../../domain/repositories/base_home_repository.dart';
import '../datasources/remote/home_remote_datasource.dart';
import '../models/products_response.dart';

@LazySingleton(as: BaseHomeRepository)
class HomeRepository extends BaseHomeRepository {
  HomeRepository(this.baseHomeDataSource);
  final BaseHomeDataSource baseHomeDataSource;
  @override
  Future<Either<Failure, ProductsResponse>> getProducts(
    GetProductsParams params,
  ) async {
    final result = await safeCallApi(() async {
      return await baseHomeDataSource.getProducts(params);
    });

    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
