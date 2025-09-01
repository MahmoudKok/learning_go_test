import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_go_test/src/core/Api/api_endpoints.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

import '../../../../app/features/auth/features/sign_in/data/models/sign_in_model.dart';
import '../../../../app/features/auth/features/sign_in/domain/entities/params/sign_in_params.dart';
import '../../Api/api_response.dart';

part 'auth_services.g.dart';

@LazySingleton()
@RestApi()
abstract class AuthServices {
  @factoryMethod
  factory AuthServices(Dio dio, {@Named('baseUrl') String baseUrl}) =
      _AuthServices;

  @POST(ApiEndPoints.login)
  Future<SignInResponse> login(@Body() Map<String, dynamic> body);
}
