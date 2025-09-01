import 'package:dartz/dartz.dart';

import '../../../../../src/errors/failures/app_failures.dart';
import '../../../home/data/models/products_response.dart';
import '../entities/search_query_params.dart';

abstract class BaseSearchProductsRepository {
  Future<Either<Failure, ProductsResponse>> searchProducts(
    SearchQueryParams params,
  );
}
