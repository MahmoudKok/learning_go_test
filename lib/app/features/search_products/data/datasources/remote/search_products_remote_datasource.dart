import 'package:injectable/injectable.dart';

import '../../../../../../src/core/Api/api_response.dart';
import '../../../../../../src/core/di/service_locator.dart';
import '../../../../../../src/core/services/search_services/search_products_services.dart';
import '../../../../home/data/models/products_response.dart';
import '../../../domain/entities/search_query_params.dart';

abstract class BaseSearchProductsDataSource {
  Future<ApiResponse<ProductsResponse>> searchProducts(
    SearchQueryParams params,
  );
}

@LazySingleton(as: BaseSearchProductsDataSource)
class SearchProductsDataSourceImpl implements BaseSearchProductsDataSource {
  final SearchProductsServices _searchServices = sl<SearchProductsServices>();

  @override
  Future<ApiResponse<ProductsResponse>> searchProducts(
    SearchQueryParams params,
  ) async {
    try {
      final result = await _searchServices.searchProducts(
        params.q,
        params.limit,
        params.skip,
      );
      return ApiResponse.success(data: result);
    } catch (e) {
      rethrow;
    }
  }
}
