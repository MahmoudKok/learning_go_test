import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_go_test/app/features/home/data/models/products_response.dart';
import 'package:learning_go_test/app/features/search_products/domain/entities/search_query_params.dart';
import 'package:learning_go_test/src/errors/failures/app_failures.dart';

import '../../../../../src/core/Api/safe_api_call.dart';
import '../../domain/repositories/base_search_products_repository.dart';
import '../datasources/remote/search_products_remote_datasource.dart';

@LazySingleton(as: BaseSearchProductsRepository)
class SearchProductsRepository extends BaseSearchProductsRepository {
  SearchProductsRepository(this.baseSearchProductsDataSource);
  final BaseSearchProductsDataSource baseSearchProductsDataSource;

  @override
  Future<Either<Failure, ProductsResponse>> searchProducts(
    SearchQueryParams params,
  ) async {
    final result = await safeCallApi(() async {
      return await baseSearchProductsDataSource.searchProducts(params);
    });

    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
