import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../app/features/home/data/models/product_model.dart';
import '../../../../app/features/home/data/models/products_response.dart';
import '../../Api/api_endpoints.dart';
import '../../Api/api_response.dart';
import 'package:retrofit/error_logger.dart';
part 'search_products_services.g.dart';

@LazySingleton()
@RestApi()
abstract class SearchProductsServices {
  @factoryMethod
  factory SearchProductsServices(Dio dio, {@Named('baseUrl') String baseUrl}) =
      _SearchProductsServices;

  /// Example: /products/search?q=phone&limit=20&skip=0
  @GET(ApiEndPoints.searchProducts)
  Future<ProductsResponse> searchProducts(
    @Query('q') String q,
    @Query('limit') int limit,
    @Query('skip') int skip,
  );
}
