import 'package:dartz/dartz.dart';

import '../../../../../src/errors/failures/app_failures.dart';
import '../../data/models/user_model.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure, UserModel>> getProfile();
}
