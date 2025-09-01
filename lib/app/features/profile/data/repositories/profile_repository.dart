import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_go_test/app/features/profile/data/models/user_model.dart';
import 'package:learning_go_test/src/errors/failures/app_failures.dart';

import '../../../../../src/core/Api/safe_api_call.dart';
import '../../domain/repositories/base_profile_repository.dart';
import '../datasources/remote/profile_remote_datasource.dart';

@LazySingleton(as: BaseProfileRepository)
class ProfileRepository extends BaseProfileRepository {
  ProfileRepository(this.baseProfileDataSource);
  final BaseProfileDataSource baseProfileDataSource;

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    final result = await safeCallApi(() async {
      return await baseProfileDataSource.getProfile();
    });

    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
