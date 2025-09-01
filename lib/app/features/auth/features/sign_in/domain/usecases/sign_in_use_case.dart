import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../../src/core/architecture/base_usecase.dart';
import '../../../../../../../src/errors/failures/app_failures.dart';
import '../../data/models/sign_in_model.dart';
import '../entities/params/sign_in_params.dart';
import '../repositories/base_sign_in_repository.dart';

@LazySingleton()
class LoginUseCase extends BaseUseCase<SignInResponse, SignInParams> {
  final BaseSignInRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, SignInResponse>> call(SignInParams parameters) {
    return repository.login(parameters);
  }
}
