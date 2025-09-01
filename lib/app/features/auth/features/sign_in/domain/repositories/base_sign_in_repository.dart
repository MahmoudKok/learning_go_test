import 'package:dartz/dartz.dart';

import '../../../../../../../src/errors/failures/app_failures.dart';
import '../../data/models/sign_in_model.dart';
import '../entities/params/sign_in_params.dart';

abstract class BaseSignInRepository {
  Future<Either<Failure, SignInResponse>> login(SignInParams params);
}
