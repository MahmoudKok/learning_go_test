import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../app/features/profile/data/models/user_model.dart';
import '../../Api/api_endpoints.dart';

part 'profile_services.g.dart';

@lazySingleton
@RestApi()
abstract class ProfileServices {
  @factoryMethod
  factory ProfileServices(Dio dio, {@Named('baseUrl') String baseUrl}) =
      _ProfileServices;

  /// Example: /users/{id}
  @GET(ApiEndPoints.profile)
  Future<UserModel> getProfile();
}
