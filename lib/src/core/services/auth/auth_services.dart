import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'auth_services.g.dart';

@LazySingleton()
@RestApi()
abstract class AuthServices {
  @factoryMethod
  factory AuthServices(Dio dio, {@Named('baseUrl') String baseUrl}) =
      _AuthServices;

  // @POST(ApiEndPoints.login)
  // Future<ApiResponse<SignInResponse>> signInWithEmail(
  //   @Body() Map<String, dynamic> body,
  // );
}
