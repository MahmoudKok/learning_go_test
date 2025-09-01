import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_go_test/app/features/home/data/models/product_model.dart';
import 'package:learning_go_test/src/errors/failures/app_failures.dart';

import '../../../../../src/core/Api/safe_api_call.dart';
import '../../domain/repositories/base_product_details_repository.dart';
import '../datasources/remote/product_details_remote_datasource.dart';

@LazySingleton(as: BaseProductDetailsRepository)
class ProductDetailsRepository extends BaseProductDetailsRepository {
  ProductDetailsRepository(this.baseProductDetailsDataSource);
  final BaseProductDetailsDataSource baseProductDetailsDataSource;

  @override
  Future<Either<Failure, ProductModel>> getProductDetails(String id) async {
    final result = await safeCallApi(() async {
      return await baseProductDetailsDataSource.getProductDetails(id);
    });

    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
