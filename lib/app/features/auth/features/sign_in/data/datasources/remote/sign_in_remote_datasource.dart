import 'package:injectable/injectable.dart';

import '../../../../../../../../src/core/Api/api_response.dart';
import '../../../../../../../../src/core/di/service_locator.dart';
import '../../../../../../../../src/core/services/auth/auth_services.dart';
import '../../../domain/entities/params/sign_in_params.dart';
import '../../models/sign_in_model.dart';

abstract class BaseSignInDataSource {
  Future<ApiResponse<SignInResponse>> login(SignInParams params);
}

@LazySingleton(as: BaseSignInDataSource)
class SignInDataSourceImpl implements BaseSignInDataSource {
  final AuthServices _services = sl<AuthServices>();
  @override
  Future<ApiResponse<SignInResponse>> login(SignInParams params) async {
    try {
      final result = await _services.login({
        'username': params.username,
        'password': params.password,
        "expiresInMins": 1,
      });
      return ApiResponse.success(data: result, message: 'Success');
    } catch (e) {
      rethrow;
    }
  }
}
