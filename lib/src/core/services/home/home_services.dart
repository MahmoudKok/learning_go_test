import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';


part 'home_services.g.dart';

@LazySingleton()
@RestApi()
abstract class HomeServices {
  @factoryMethod
  factory HomeServices(Dio dio, {@Named('baseUrl') String baseUrl}) =
      _HomeServices;
}
