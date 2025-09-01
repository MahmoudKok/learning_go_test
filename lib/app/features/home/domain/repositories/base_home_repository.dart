import 'package:dartz/dartz.dart';

import '../../../../../src/errors/failures/app_failures.dart';
import '../../data/models/products_response.dart';
import '../entities/get_products_params.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, ProductsResponse>> getProducts(
    GetProductsParams params,
  );
}
