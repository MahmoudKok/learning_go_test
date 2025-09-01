import 'package:injectable/injectable.dart';
import 'package:learning_go_test/app/features/profile/data/models/user_model.dart';

import '../../../../../../src/core/Api/api_response.dart';
import '../../../../../../src/core/di/service_locator.dart';
import '../../../../../../src/core/services/profile_services/profile_services.dart';

abstract class BaseProfileDataSource {
  Future<ApiResponse<UserModel>> getProfile();
}

@LazySingleton(as: BaseProfileDataSource)
class ProfileDataSourceImpl implements BaseProfileDataSource {
  final ProfileServices _services = sl<ProfileServices>();

  @override
  Future<ApiResponse<UserModel>> getProfile() async {
    try {
      final result = await _services.getProfile();
      return ApiResponse.success(data: result);
    } catch (e) {
      rethrow;
    }
  }
}
