import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../../src/core/architecture/base_usecase.dart';
import '../../../../../src/errors/failures/app_failures.dart';
import '../../data/models/products_response.dart';
import '../entities/get_products_params.dart';
import '../repositories/base_home_repository.dart';

@LazySingleton()
class GetProductsUseCase
    extends BaseUseCase<ProductsResponse, GetProductsParams> {
  final BaseHomeRepository repository;

  GetProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductsResponse>> call(GetProductsParams parameters) {
    return repository.getProducts(parameters);
  }
}
