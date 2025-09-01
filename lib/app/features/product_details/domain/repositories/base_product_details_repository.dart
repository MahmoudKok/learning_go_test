import 'package:dartz/dartz.dart';

import '../../../../../src/errors/failures/app_failures.dart';
import '../../../home/data/models/product_model.dart';

abstract class BaseProductDetailsRepository {
  Future<Either<Failure, ProductModel>> getProductDetails(String id);
}
