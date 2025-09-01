import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../src/core/Api/safe_api_call.dart';
import '../../../../../../../src/errors/failures/app_failures.dart';
import '../../domain/entities/params/sign_in_params.dart';
import '../../domain/repositories/base_sign_in_repository.dart';
import '../datasources/remote/sign_in_remote_datasource.dart';
import '../models/sign_in_model.dart';

@LazySingleton(as: BaseSignInRepository)
class SignInRepository extends BaseSignInRepository {
  SignInRepository(this.baseSignInDataSource);
  final BaseSignInDataSource baseSignInDataSource;

  @override
  Future<Either<Failure, SignInResponse>> login(SignInParams params) async {
    final result = await safeCallApi(() async {
      return await baseSignInDataSource.login(params);
    });

    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
