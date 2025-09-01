import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../app/features/home/data/models/product_model.dart';
import '../../Api/api_endpoints.dart';

part 'product_services.g.dart';

@lazySingleton
@RestApi()
abstract class ProductServices {
  @factoryMethod
  factory ProductServices(Dio dio, {@Named('baseUrl') String baseUrl}) =
      _ProductServices;

  @GET(ApiEndPoints.productDetails)
  Future<ProductModel> getProductDetails(@Path('id') String id);
}
