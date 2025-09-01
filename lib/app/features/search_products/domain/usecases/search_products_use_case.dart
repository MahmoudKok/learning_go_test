import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_go_test/app/features/search_products/domain/repositories/base_search_products_repository.dart';

import '../../../../../src/core/architecture/base_usecase.dart';
import '../../../../../src/errors/failures/app_failures.dart';
import '../../../home/data/models/products_response.dart';
import '../entities/search_query_params.dart';

@LazySingleton()
class SearchProductsUseCase
    extends BaseUseCase<ProductsResponse, SearchQueryParams> {
  final BaseSearchProductsRepository repository;

  SearchProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductsResponse>> call(SearchQueryParams parameters) {
    return repository.searchProducts(parameters);
  }
}
