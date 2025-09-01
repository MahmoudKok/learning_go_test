import 'package:injectable/injectable.dart';
import 'package:learning_go_test/src/core/Api/api_response.dart';
import 'package:learning_go_test/src/core/services/search_services/search_products_services.dart';

import '../../../../../../src/core/di/service_locator.dart';
import '../../../../../../src/core/services/product_services/product_services.dart';
import '../../../../home/data/models/product_model.dart';

abstract class BaseProductDetailsDataSource {
  Future<ApiResponse<ProductModel>> getProductDetails(String id);
}

@LazySingleton(as: BaseProductDetailsDataSource)
class ProductDetailsDataSourceImpl implements BaseProductDetailsDataSource {
  final ProductServices _services = sl<ProductServices>();

  @override
  Future<ApiResponse<ProductModel>> getProductDetails(String id) async {
    try {
      final result = await _services.getProductDetails(id);
      return ApiResponse.success(data: result);
    } catch (e) {
      rethrow;
    }
  }
}
