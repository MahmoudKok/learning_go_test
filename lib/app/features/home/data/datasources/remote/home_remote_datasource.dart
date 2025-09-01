import 'package:injectable/injectable.dart';
import 'package:learning_go_test/src/core/services/home/home_services.dart';

import '../../../../../../src/core/Api/api_response.dart';
import '../../../../../../src/core/di/service_locator.dart';
import '../../../../../../src/logger/dev_logger.dart';
import '../../../domain/entities/get_products_params.dart';
import '../../models/products_response.dart';

abstract class BaseHomeDataSource {
  Future<ApiResponse<ProductsResponse>> getProducts(GetProductsParams params);
}

@LazySingleton(as: BaseHomeDataSource)
class HomeDataSourceImpl implements BaseHomeDataSource {
  final HomeServices _homeServices = sl<HomeServices>();
  @override
  Future<ApiResponse<ProductsResponse>> getProducts(
    GetProductsParams params,
  ) async {
    try {
      final result = await _homeServices.getProducts(params.limit, params.skip);
      return ApiResponse<ProductsResponse>.success(
        data: result,
        message: 'Success',
      );
    } catch (e) {
      Dev.logError(e.toString());
      rethrow;
    }
  }
}
